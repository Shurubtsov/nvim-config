-- main file for nvim config --
local lazy_opts = require('package.utils').options
Lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(Lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",   -- latest stable release
        Lazypath,
    })
end
vim.opt.rtp:prepend(Lazypath)

require('options')
require('keymaps')
require('autocommands')
require("lazy").setup('plugins', lazy_opts)

-- Load saved colorscheme or use default
local colorscheme_util = require('package.colorscheme')
local saved_colorscheme = colorscheme_util.load_colorscheme()
if saved_colorscheme and saved_colorscheme ~= "" then
    colorscheme_util.apply_colorscheme(saved_colorscheme)
else
    -- Default to gruvbox on first run
    colorscheme_util.apply_colorscheme("gruvbox")
    colorscheme_util.save_colorscheme("gruvbox")
end
