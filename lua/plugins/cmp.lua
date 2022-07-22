local lspconfig = require 'lspconfig'
local lspinstall = require 'nvim-lsp-installer'
local maps = require 'mappings'
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
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
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
        { name = 'luasnip', priority = 4, max_item_count = 4 },
        { name = 'nvim_lsp', priority = 3, max_item_count = 6 },
        { name = 'path', priority = 5, max_item_count = 2 },
        { name = 'buffer', priority = 2, keyword_length = 4, max_item_count = 2 },
    },
}
