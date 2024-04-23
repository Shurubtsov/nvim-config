-- initialize configurations --
return {
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "sonokai"
        end
    },
    { "fatih/vim-go" },
    { "ziglang/zig.vim" },
    { "nvim-lua/plenary.nvim" },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- extension for telescope
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<C-f>", "<cmd>FzfLua live_grep<cr>", "fzf toggle live grep" },
        },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            {"<leader>er", "<cmd>GoIfErr<cr>", "go.nvim insert iferr construction"},
            {"<leader>fi", "<cmd>GoImplemets<cr>", "go.nvim find interface implementations"},
        },
        config = function()
            local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require('go.format').goimports()
                end,
                group = format_sync_grp,
            })
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        -- <Tab>: choose next snippets
        -- <Shift-Tab>: choose prev snippets
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = { "nvim-cmp" },
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
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

            -- map('n', '<C-f>', '<cmd>:HopWord<CR>', opts)
            map('n', 'F', '<cmd>:HopLine<CR>', opts)
        end,
    }
}
