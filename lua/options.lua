-- options for editor --

vim.opt.number = true -- show number column
vim.opt.mouse = 'a' -- enable mouse in all mods
vim.opt.ignorecase = true -- ignore uppercase in search mode
vim.opt.smartcase = true -- makes our search ignore uppercase letters unless the search tem has an uppdercase letter.
vim.opt.tabstop = 4 -- amount of spaces in one TAB character
vim.opt.shiftwidth = 4 -- amount of spaces for characters with commands "<<" and ">>"
vim.opt.termguicolors = true -- "best" version of the colorscheme

-- disable netrw for nvim-tree 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
