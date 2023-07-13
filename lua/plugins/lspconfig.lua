-- Mason LSP package manager
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- LSP configuration for autocompletion
lspconfig = require "lspconfig"
util = require "lspconfig/util"

local function config(_config)
    return vim.tbl_deep_extend('force', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }, _config or {})
end

local on_attach = require('plugins.lsp')


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
                fieldalignment = true,
                unusedwrite = true,
            },
            staticcheck = true,
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
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml",
        "selene.toml", "selene.yml", ".git"),
    log_level = 2,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}))

-- LSP for Dockerfile
lspconfig.dockerls.setup({
    on_attach = on_attach,
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "dockerfile" },
    root_dir = util.root_pattern("Dockerfile")
})

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

-- LSP for Csharp
-- lspconfig.csharp_ls.setup({
--     on_attach = on_attach,
--     cmd = { "csharp-ls" },
--     filetypes = { "cs" },
--     root_dir = util.root_pattern('*.csproj', '*.sln')
-- })

lspconfig.omnisharp.setup({
    on_attach = on_attach,
    cmd = { "dotnet", "/home/danila/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
    -- Enables support for reading code style, naming convention and analyzer
    -- settings from .editorconfig.
    enable_editorconfig_support = true,

    enable_ms_build_load_projects_on_demand = false,

    -- Enables support for roslyn analyzers, code fixes and rulesets.
    enable_roslyn_analyzers = true,

    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
    organize_imports_on_format = true,

    -- Enables support for showing unimported types and unimported extension
    -- methods in completion lists. When committed, the appropriate using
    -- directive will be added at the top of the current file. This option can
    -- have a negative impact on initial completion responsiveness,
    -- particularly for the first few completion sessions after opening a
    -- solution.
    enable_import_completion = false,

    -- Specifies whether to include preview versions of the .NET SDK when
    -- determining which version to use for project loading.
    sdk_include_prereleases = true,

    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
    -- true
    analyze_open_documents_only = false,

    filetypes = { "cs", "vb" },
    root_dir = util.root_pattern('*.csproj', '*.sln'),
})

lspconfig.bufls.setup({
    on_attach = on_attach,
    cmd = { "bufls", "serve" },
    filetypes = { "proto" },
    root_dir = util.root_pattern("buf.work.yaml", ".git")
})

-- LSP for Markdown
lspconfig.marksman.setup({
    on_attach = on_attach,
    cmd = { "marksman", "server" },
    filetypes = { "markdown" },
    root_dir = util.root_pattern(".git", ".marksman.toml")
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
