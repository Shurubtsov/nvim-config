return {
    "beauwilliams/focus.nvim",
    keys = {
        { '<leader>h', '<cmd>FocusSplitLeft<cr>', desc = "Split left" },
        { '<leader>j', '<cmd>FocusSplitDown<cr>', desc = "Split down" },
        { '<leader>k', '<cmd>FocusSplitUp<cr>', desc = "Split up" },
        { '<leader>l', '<cmd>FocusSplitRight<cr>', desc = "Split right" },
    },
    config = function()
        require("focus").setup({
            treewidth = 20,
            compatible_filetrees = { "filetree" },
            bufnew = true
        })
    end
}
