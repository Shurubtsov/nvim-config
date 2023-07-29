-- setup must be called before loading
-- The added characters in the command represent the actions which the cursor can now perform if it reaches a line boundary
vim.cmd "set whichwrap+=<,>,[,],h,l"

local autocmd = vim.api.nvim_create_autocmd
-- local augroup = vim.api.nvim_create_augroup
local opt = vim.opt
local opt_local = vim.opt_local

-- go: format on save
autocmd('BufWritePre', {
    pattern = { '*.go' },
    callback = function()
        vim.lsp.buf.format({ async = true })
    end
})
