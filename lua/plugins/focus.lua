-- Sets the width of directory tree buffers such as NerdTree, NvimTree and CHADTree
-- Default: vim.g.nvim_tree_width or 30
require("focus").setup({
	treewidth = 20,
	compatible_filetrees = {"filetree"},
	bufnew = true
})

 -- Keymaps
local map = vim.api.nvim_set_keymap
local opts = {noremap = true}

map('n', '<leader>h', ':FocusSplitLeft<CR>', { silent = true })
map('n', '<leader>j', ':FocusSplitDown<CR>', { silent = true })
map('n', '<leader>k', ':FocusSplitUp<CR>', { silent = true })
map('n', '<leader>l', ':FocusSplitRight<CR>', { silent = true })
