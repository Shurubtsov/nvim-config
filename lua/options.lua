-- options for editor --


local options = {
    number = true,             -- show number column
    mouse = 'a',               -- enable mouse in all mods
    ignorecase = true,         -- ignore uppercase in search mode
    smartcase = true,          -- makes our search ignore uppercase letters unless the search tem has an uppdercase letter.
    tabstop = 4,               -- amount of spaces in one TAB character
    shiftwidth = 4,            -- amount of spaces for characters with commands "<<" and ">>"
    termguicolors = true,      -- "best" version of the colorscheme
    expandtab = true,          -- convert tabs to spaces
    cursorline = true,         -- highlight the current line
    relativenumber = true,     -- relative numbers line
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
