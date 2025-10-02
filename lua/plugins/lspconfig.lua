return {
    "neovim/nvim-lspconfig",
    config = function()
        -- LSP configuration for autocompletion
        local lspconfig = require "lspconfig"
        local util = require "lspconfig/util"

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
            filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
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
                local uv = vim.uv or vim.loop
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath('config')
                        and (uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                    then
                        return
                    end
                end
                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most
                        -- likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                        -- Tell the language server how to find Lua modules same way as Neovim
                        -- (see `:h lua-module-load`)
                        path = {
                            'lua/?.lua',
                            'lua/?/init.lua',
                        },
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                            -- Depending on the usage, you might want to add additional paths
                            -- here.
                            -- '${3rd}/luv/library'
                            -- '${3rd}/busted/library'
                        }
                        -- Or pull in all of 'runtimepath'.
                        -- NOTE: this is a lot slower and will cause issues when working on
                        -- your own configuration.
                        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                        -- library = {
                        --   vim.api.nvim_get_runtime_file('', true),
                        -- }
                    }
                })
            end,
            -- cmd = { "lua-language-server" },
            -- filetypes = { "lua" },
            -- root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml",
            --     "selene.toml", "selene.yml", ".git"),
            -- log_level = 2
            settings = {
                Lua = {}
            }
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
