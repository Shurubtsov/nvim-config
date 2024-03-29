return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-fzf-native.nvim" } },
    config = function()
        require('telescope').setup {
            defaults = {
                prompt_prefix = '> ',
                color_devicons = true,
                file_previewer = require('telescope.previewers').vim_buffer_cat.new,
                grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
                qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
            },
        }
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
        map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
        map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
    end
}
