vim.g.mapleader = ' ' -- main key <space>

local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
map("n", "<C-b>", "<cmd>bdelete!<CR>", opts)
map("n", "<C-w>", "<cmd>bwipeout<CR>", opts)
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save' })

