return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })

        local function set_terminal_keymaps()
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0, desc = "Exit terminal mode" })
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { buffer = 0, desc = "Exit terminal mode" })
            vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-W>h]], { buffer = 0, desc = "Navigate left" })
            vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-W>j]], { buffer = 0, desc = "Navigate down" })
            vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-W>k]], { buffer = 0, desc = "Navigate up" })
            vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-W>l]], { buffer = 0, desc = "Navigate right" })
        end

        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*",
            callback = set_terminal_keymaps,
        })

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
        local node = Terminal:new({ cmd = "node", hidden = true })
        local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
        local htop = Terminal:new({ cmd = "htop", hidden = true })
        local python = Terminal:new({ cmd = "python", hidden = true })

        vim.api.nvim_create_user_command('LazyGit', function() lazygit:toggle() end, {})
        vim.api.nvim_create_user_command('NodeToggle', function() node:toggle() end, {})
        vim.api.nvim_create_user_command('NcduToggle', function() ncdu:toggle() end, {})
        vim.api.nvim_create_user_command('HtopToggle', function() htop:toggle() end, {})
        vim.api.nvim_create_user_command('PythonToggle', function() python:toggle() end, {})
    end
}
