return {

    "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup({
            options = {
                close_command = "bdelete! %d",
                mode = "buffers",
                -- diagnostics = "nvim_lsp",
                numbers = "ordinal",
                max_name_length = 32,
                max_prefix_length = 15,
                tab_size = 0,
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                separator_style = "thin",
                sort_by = "insert_after_current",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true, -- use a "true" to enable the default, or set your own character
                    },
                },
            },
        })

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true }

        map("n", "]b", "<cmd>BufferLineCycleNext<CR>", opts)
        map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", opts)
        map("n", "tb", "<cmd>BufferLinePickClose<CR>", opts)
        map("n", "tv", "<cmd>BufferLinePick<CR>", opts)

        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end

        diagnostics_indicator = function(diagnostics_dict)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end
    end
}
