-- install packer --
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- initialize plugins --
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  
  -- Colorsheme
  use { 
	"catppuccin/nvim", 
	as = "catppuccin",
	config = function()
		require('plugins.catppucin')
	end
  }

  -- Statusline
  use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	config = function()
		require('plugins.lualine')
	end
  }

  -- Configurations for Nvim LSP
  use {
	'neovim/nvim-lspconfig',
	config = function()
		require('plugins.lspconfig')
	end
  }

  -- File explorer
  use {
  	'nvim-tree/nvim-tree.lua',
  	requires = {
    	'nvim-tree/nvim-web-devicons', -- optional, for file icons
  	},
  	tag = 'nightly', -- optional, updated every week. (see issue #1193)
  	config = function()
		require('plugins.nvim-tree')  
  	end
  }

  -- Syntax highlight
  use {
  	'nvim-treesitter/nvim-treesitter',
  	run = function()
  		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
  		ts_update()
  	end,
	
	config = function()
		require('plugins.treesitter')
	end
  }

  -- Plugin for Autocompletion
  use {
	  'hrsh7th/nvim-cmp',
	  config = function()
		  require('plugins.cmp')
	  end
  }

  -- Dependencies for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'rafamadriz/friendly-snippets' -- Snippets for LuaSnip
  use {
	  "L3MON4D3/LuaSnip", 
	  after = 'friendly-snippets',
	  after = 'nvim-cmp',
	  config = function()
		  require('luasnip/loaders/from_vscode').load({
          paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
        })
	  end
  } -- Plugin for use snippets

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
