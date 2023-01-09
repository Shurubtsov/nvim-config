-- install packer --
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- initialize plugins --
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here

	-- Vim-be-good trainer
	use({
		"ThePrimeagen/vim-be-good",
	})

	-- golang plugin
	use({
		"fatih/vim-go",
	})

	use({
		"olexsmir/gopher.nvim",
		requires = { -- dependencies
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			local path = os.getenv("HOME") .. "/go/bin/gotests"
			-- print("debug: " .. path)
			require("gopher").setup({
				commands = {
					go = "go",
					gomodifytags = "gomodifytags",
					gotests = path, -- also you can set custom command path
					impl = "impl",
					iferr = "iferr",
				},
			})
		end,
	})

	-- Colorsheme
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("plugins.catppucin")
		end,
	})

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.lualine")
		end,
	})

	-- Configurations for Nvim LSP

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("plugins.lspconfig")
		end,
	})

	use({
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.web-icons")
		end,
	})

	-- Formatters
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local on_attach = require("plugins.lsp")

			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.markdownlint,
				},
				on_attach = on_attach,
			})
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- File explorer
	use({
		"nvim-tree/nvim-tree.lua",
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			require("plugins.nvim-tree")
		end,
	})

	-- Syntax highlight
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,

		config = function()
			require("plugins.treesitter")
		end,
	})

	-- Plugin for Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.cmp")
		end,
	})

	-- Markdown-preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Bufferline with upbars
	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		config = function()
			require("plugins.bufferline")
		end,
	})

	-- Dependencies for nvim-cmp
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("rafamadriz/friendly-snippets") -- Snippets for LuaSnip
	use({
		"L3MON4D3/LuaSnip",
		after = { "friendly-snippets", "nvim-cmp" },
		config = function()
			require("luasnip/loaders/from_vscode").load({
				paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
			})
		end,
	}) -- Plugin for use snippets

	-- Fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugins.telescope")
		end,
	})

	-- Fast motion
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("plugins.hop")
		end,
	})

	-- Utility
	use({
		"beauwilliams/focus.nvim", -- split windows
		config = function()
			require("plugins.focus")
		end,
	})
	use({
		"yamatsum/nvim-cursorline", -- cursorline highlight
		config = function()
			require("plugins.cursor")
		end,
	})

	-- gitsigns
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"windwp/nvim-autopairs",
		requires = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({
				fast_wrap = {},
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	})

	use({
		"glepnir/dashboard-nvim", -- ashboard start menu
		config = function()
			require("plugins.dashboard")
		end,
	})

	use({
		--[[ 
		`gcc` - Toggles the current line using linewise comment
		`gbc` - Toggles the current line using blockwise comment
		`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
		`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
		`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
		`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment ]]

		"numToStr/Comment.nvim", -- comments
		config = function()
			require("Comment").setup()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
