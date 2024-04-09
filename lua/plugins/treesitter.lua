return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { 'go', 'lua', 'make', 'yaml', 'sql', 'proto', 'markdown',
                'gomod', 'gowork', 'rust', 'vim', 'luadoc', 'zig' },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
        }
    end
}
-- return {
--     "nvim-treesitter/nvim-treesitter",
--     build = function()
--         local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
--         ts_update()
--     end,
--     config = function()
--         -- Treesitter is syntax highlighter
--         require 'nvim-treesitter.configs'.setup {
--             ensure_installed = { 'go', 'lua', 'make', 'yaml', 'sql', 'proto', 'markdown',
--                 'gomod', 'gowork', 'rust', 'vim', 'luadoc', 'zig' },
--             highlight = { enable = true },
--         }
--     end
-- }
