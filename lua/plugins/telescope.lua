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
                file_ignore_patterns = { ".git", "go.mod", "go.sum" },
            },
            pickers = {
                live_grep = {
                    max_results = 30,
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                }
            },
        }
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require('telescope').load_extension('fzf')

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
        map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
        map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
    end
}
