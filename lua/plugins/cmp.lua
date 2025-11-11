return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        -- "saadparwaiz1/cmp_luasnip",
        -- "rafamadriz/friendly-snippets",
    },
    config = function()
        -- nvim-cmp setup
        local cmp = require('cmp')

        cmp.setup {
            snippet = {
                expand = function(args)
                    -- require('luasnip').lsp_expand(args.body)
                    vim.fn["UltiSnips#Anon"](args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    -- elseif require('luasnip').expand_or_jumpable() then
                    --     require('luasnip').expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    -- elseif require('luasnip').jumpable(-1) then
                    --     require('luasnip').jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = {
                { name = 'nvim_lsp' },
                -- { name = 'luasnip' },
                { name = 'ultisnips' },
            },
        }
    end
}
