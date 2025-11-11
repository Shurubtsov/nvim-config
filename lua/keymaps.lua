vim.g.mapleader = ' '

vim.keymap.set("n", "<C-b>", "<cmd>bdelete!<CR>", { desc = "Force delete buffer" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up (centered)" })
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save file' })

