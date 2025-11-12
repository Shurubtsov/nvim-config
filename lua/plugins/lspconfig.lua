return {
    "neovim/nvim-lspconfig",
    config = function()
        -- LSP configuration for autocompletion
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local function config(_config)
            return vim.tbl_deep_extend('force', {
                capabilities = capabilities,
            }, _config or {})
        end

        local on_attach = require('package.lsp')

        -- LSP for Golang
        vim.lsp.config('gopls', config({
            on_attach = on_attach,
            cmd = { "gopls", "serve" },
            filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
            root_markers = { "go.work", "go.mod", ".git" },
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
        vim.lsp.config('rust_analyzer', config({
            on_attach = on_attach,
            cmd = { "rust-analyzer" },
            filetypes = { "rust", "rs" },
            root_markers = { "Cargo.toml", "rust-project.json" },
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
        vim.lsp.config('lua_ls', config({
            on_attach = on_attach,
            on_init = function(client)
                local uv = vim.uv or vim.loop
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath('config')
                        and (uv.fs_stat(path .. '/.luarc.json') or uv.fs_stat(path .. '/.luarc.jsonc'))
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
                        }
                    }
                })
            end,
            settings = {
                Lua = {}
            }
        }))

        -- LSP for C, C++ etc.
        vim.lsp.config('clangd', config({
            on_attach = on_attach,
            cmd = { "clangd" },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
            root_markers = {
                '.clangd',
                '.clang-tidy',
                '.clang-format',
                'compile_commands.json',
                'compile_flags.txt',
                'configure.ac',
                '.git'
            }
        }))

        -- LSP for SQL
        vim.lsp.config('sqlls', config({
            on_attach = on_attach,
            cmd = { "sql-language-server", "up", "--method", "stdio" },
            filetypes = { "sql", "mysql" }
        }))

        -- LSP for Zig (ziglang)
        vim.lsp.config('zls', config({
            on_attach = on_attach,
            cmd = { "zls" },
            filetypes = { "zig", "zir" },
            root_markers = { "zls.json", ".git" }
        }))
    end
}
