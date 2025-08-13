return {
    "neovim/nvim-lspconfig",
    config = function()
        -- LSP configuration for autocompletion
        lspconfig = require "lspconfig"
        util = require "lspconfig/util"

        local function config(_config)
            return vim.tbl_deep_extend('force', {
                capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            }, _config or {})
        end

        local on_attach = require('package.lsp')

        -- LSP for Golang
        lspconfig.gopls.setup(config({
            on_attach = on_attach,
            cmd = { "gopls", "serve" },
            filetypes = { "go", "gomod" },
            root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                        unusedvariable = true,
                        fieldalignment = true,
                        unusedwrite = true,
                        shadow = true,
                    },
                    staticcheck = true,
                    gofumpt = true,
                },
            },
        }))

        -- LSP for Rust
        lspconfig.rust_analyzer.setup(config({
            on_attach = on_attach,
        cmd = { "rust-analyzer" },
            filetypes = { "rust", "rs" },
            root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
            settings = {
                ["rust-analyzer"] = {
                    imports = {
                        granularity = {
                            group = "module",
                        },
                        prefix = "self",
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                    },
                    procMacro = {
                        enable = true
                    },
                }
            }
        }))

        -- LSP for Lua
        lspconfig.lua_ls.setup(config({
            on_attach = on_attach,
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if not vim.uv.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT'
                            },
                            -- Make the server aware of Neovim runtime files
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME,
                                    "${3rd}/luv/library",
                                    -- "${3rd}/busted/library",
                                }
                                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                -- library = vim.api.nvim_get_runtime_file("", true)
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { 'vim' },
                            },
                            -- Do not send telemetry data containing a randomized but unique identifier
                            telemetry = {
                                enable = false,
                            },
                        }
                    })

                    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                end
                return true
            end,
            cmd = { "lua-language-server" },
            filetypes = { "lua" },
            root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml",
                "selene.toml", "selene.yml", ".git"),
            log_level = 2
        }))

        -- LSP for C, C++ etc.
        lspconfig.clangd.setup({
            on_attach = on_attach,
            cmd = { "clangd" },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
            root_dir = util.root_pattern(
                '.clangd',
                '.clang-tidy',
                '.clang-format',
                'compile_commands.json',
                'compile_flags.txt',
                'configure.ac',
                '.git'
            )
        })

        -- LSP for SQL
        lspconfig.sqlls.setup({
            on_attach = on_attach,
            cmd = { "sql-language-server", "up", "--method", "stdio" },
            filetypes = { "sql", "mysql" }
        })

        -- LSP for Zig (ziglang)
        lspconfig.zls.setup({
            on_attach = on_attach,
            cmd = { "zls" },
            filetypes = { "zig", "zir" },
            root_dir = util.root_pattern("zls.json", ".git")
        })

        -- To get your imports ordered on save
        function go_org_imports(wait_ms)
            local params = vim.lsp.util.make_range_params()
            params.context = { only = { "source.organizeImports" } }
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
            for cid, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                    if r.edit then
                        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                        vim.lsp.util.apply_workspace_edit(r.edit, enc)
                    end
                end
            end
        end
    end
}
