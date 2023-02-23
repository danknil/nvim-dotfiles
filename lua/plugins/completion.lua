local function completion()
    ---@diagnostic disable: missing-parameter
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    vim.opt.completeopt = { 'menu', 'noselect' }

    luasnip.setup {}

    cmp.setup {
        window = {
            completion = {
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
                col_offset = -3,
                side_padding = 0,
            },
        },
        formatting = {
            format = require('lspkind').cmp_format {
                mode = 'symbol', -- show only symbol annotations
                maxwidth = 50,
                ellipsis_char = '...',

                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                -- before = function(entry, vim_item)
                --     return vim_item
                -- end,
            },
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
            ['<C-Space>'] = cmp.mapping.select_next_item {
                behavior = cmp.SelectBehavior.Select,
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    local entry = cmp.get_selected_entry()
                    if not entry then
                        if not luasnip.expand_or_locally_jumpable() then
                            cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
                            cmp.confirm { behavior = cmp.ConfirmBehavior.Replace }
                        else
                            luasnip.expand_or_jump()
                        end
                    else
                        cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
                    end
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        sources = {
            { name = 'path', priority = 5, max_item_count = 2 },
            { name = 'luasnip', priority = 4, max_item_count = 4 },
            { name = 'nvim_lsp', priority = 3, max_item_count = 16 },
            { name = 'buffer', priority = 2, keyword_length = 2, max_item_count = 8 },
        },
    }

    require('mappings').load_mappings('luasnip', { silent = true, noremap = true })
end

-- TODO: add this icons
-- icons = {
--     mode = 'short',
--     mappings = {
--         Text = '',
--         Method = '',
--         Function = '',
--         Constructor = '',
--         Field = 'ﰠ',
--         Variable = '',
--         Class = 'ﴯ',
--         Interface = '',
--         Module = '',
--         Property = 'ﰠ',
--         Unit = '塞',
--         Value = '',
--         Enum = '',
--         Keyword = '',
--         Snippet = '',
--         Color = '',
--         File = '',
--         Reference = '',
--         Folder = '',
--         EnumMember = '',
--         Constant = '',
--         Struct = 'פּ',
--         Event = '',
--         Operator = '',
--         TypeParameter = '',
--     },
-- },

return {
    -- completion
    {
        'hrsh7th/nvim-cmp',
        config = completion,
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'onsails/lspkind.nvim',
        },
    },
}
