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
