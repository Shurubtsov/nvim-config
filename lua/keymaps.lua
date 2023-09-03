vim.g.mapleader = ' ' -- main key <space>
-- CTRL + W , c = close current window (not buffer)
-- CTRL + W, o = close all windows but keep alive current window
local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
map("n", "<C-b>", "<cmd>bdelete!<CR>", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save' })

