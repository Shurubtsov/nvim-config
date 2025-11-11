return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { 'go', 'lua', 'make', 'yaml', 'sql', 'proto', 'markdown',
                'gomod', 'gowork', 'rust', 'vim', 'luadoc', 'zig' },
            sync_install = false,
            highlight = { enable = true },
        }
    end
}
