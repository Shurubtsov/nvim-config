require'hop'.setup {
  -- Hop configuration goes there
  keys = 'etovxqpdygfblzhckisuran',
  case_insensitive = false, 
}

 -- Keymaps
local map = vim.api.nvim_set_keymap
local opts = {noremap = true}

map('n', 'f', '<cmd>:HopWord<CR>', opts)
map('n', 'F', '<cmd>:HopLine<CR>', opts)
