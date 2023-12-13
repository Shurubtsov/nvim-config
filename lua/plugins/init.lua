-- initialize configurations --
return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "kanagawa"
        end
    },
    { "fatih/vim-go" },
    { "ziglang/zig.vim" },
    { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }, -- markdown preview (bin in dir: ~/.local/bin)
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- extension for telescope
    {
        "olexsmir/gopher.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local path = os.getenv("HOME") .. "/go/bin/gotests"
            require("gopher").setup({
                commands = {
                    go = "go",
                    gomodifytags = "gomodifytags",
                    gotests = path, -- also you can set custom command path
                    impl = "impl",
                    iferr = "iferr",
                },
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "friendly-snippets", "nvim-cmp" },
        config = function()
            require("luasnip/loaders/from_vscode").load({
                paths = { Lazypath .. "/friendly-snippets" },
            })
        end,
    },
    {
        "yamatsum/nvim-cursorline", -- cursorline highlight
        config = function()
            require('nvim-cursorline').setup {
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                }
            }
        end,
    },
    {
        'echasnovski/mini.pairs',
        branch = 'stable',
        config = function()
            require('mini.pairs').setup()
        end
    },
    {
        "numToStr/Comment.nvim", -- comments
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        config = function()
            require 'hop'.setup {
                -- Hop configuration goes there
                keys = 'etovxqpdygfblzhckisuran',
                case_insensitive = false,
            }

            -- Keymaps
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true }

            map('n', '<C-f>', '<cmd>:HopWord<CR>', opts)
            map('n', 'F', '<cmd>:HopLine<CR>', opts)
        end,
    }
}
