-- setup must be called before loading
-- The added characters in the command represent the actions which the cursor can now perform if it reaches a line boundary
vim.cmd "set whichwrap+=<,>,[,],h,l"

-- Save colorscheme when it changes
local colorscheme_group = vim.api.nvim_create_augroup("ColorschemeAutoSave", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    group = colorscheme_group,
    callback = function()
        local colorscheme = vim.g.colors_name
        if colorscheme then
            require('package.colorscheme').save_colorscheme(colorscheme)
        end
    end,
})
