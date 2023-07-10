-- Treesitter is syntax highlighter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'go', 'lua', 'make', 'yaml', 'sql', 'proto', 'markdown',
        'gomod', 'gowork', 'rust', 'vim', 'luadoc', 'zig' },
    highlight = { enable = true },
}
