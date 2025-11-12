-- initialize configurations --
return {
    -- Colorschemes - multiple options for dynamic switching
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "hard", -- can be "hard", "soft" or empty string
            })
        end
    },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
    { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
    { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
    { "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
    { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },
    { "Mofiqul/dracula.nvim", lazy = false, priority = 1000 },
    { "fatih/vim-go", ft = { "go", "gomod", "gowork" } },
    { "ziglang/zig.vim", ft = { "zig", "zir" } },
    ----------------------------
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer", "gopls", "clangd", "sqlls", "zls" },
            automatic_enable = false
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>fg", "<cmd>FzfLua live_grep<cr>",           "fzf live grep" },
            { "<leader>ff", "<cmd>FzfLua files<cr>",               "fzf find files" },
            { "<leader>fr", "<cmd>FzfLua lsp_implementations<cr>", "fzf find LSP implementations" },
            { "<leader>fc", "<cmd>FzfLua colorschemes<cr>",        "fzf colorscheme picker" },
        },
        opts = {}
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            { "<leader>ef", "<cmd>GoImpl<cr>", "go.nvim implement interface" },
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
        "yamatsum/nvim-cursorline",
        event = { "BufReadPost", "BufNewFile" },
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
        branch = "v2",
        keys = {
            { 'F', '<cmd>HopLine<cr>', desc = "Hop to line" }
        },
        config = function()
            require 'hop'.setup {
                keys = 'etovxqpdygfblzhckisuran',
                case_insensitive = false,
            }
        end,
    }
}
