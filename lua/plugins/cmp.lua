---@diagnostic disable: missing-parameter 
local cmp = require 'cmp'
local luasnip = require 'luasnip'

vim.opt.completeopt = { 'menu', 'noselect' }

cmp.setup {
    window = {
        completion = {
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
            col_offset = -3,
            side_padding = 0,
        },
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
            local kind = require('lspkind').cmp_format { mode = 'symbol_text', maxwidth = 50 }(entry, vim_item)
            local strings = vim.split(kind.kind, '%s', { trimempty = true })
            kind.kind = ' ' .. strings[1] .. ' '
            kind.menu = ''
            return kind
        end,
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
