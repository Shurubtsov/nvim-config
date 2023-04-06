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
	root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"),
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
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
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

-- LSP for Markdown
lspconfig.marksman.setup({
	on_attach = on_attach,
	cmd = { "marksman", "server" },
	filetypes = { "markdown" },
	root_dir = util.root_pattern(".git", ".marksman.toml")
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
