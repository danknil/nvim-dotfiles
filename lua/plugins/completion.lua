local function completion()
    ---@diagnostic disable: missing-parameter
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    local types = require 'cmp.types'
    local str = require 'cmp.utils.str'

    vim.opt.completeopt = { 'menu', 'noselect' }

    luasnip.setup {}

    cmp.setup {
        window = {
            completion = {
                border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
                scrollbar = '║',
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
                col_offset = -3,
                side_padding = 1,
            },
            documentation = {
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                scrollbar = '║',
            },
        },
        formatting = {
            fields = {
                cmp.ItemField.Kind,
                cmp.ItemField.Abbr,
                cmp.ItemField.Menu,
            },
            format = require('lspkind').cmp_format {
                with_text = false,
                before = function(entry, vim_item)
                    -- Get the full snippet (and only keep first line)
                    local word = entry:get_insert_text()
                    if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
                        word = vim.lsp.util.parse_snippet(word)
                    end
                    word = str.oneline(word)

                    -- concatenates the string
                    -- local max = 50
                    -- if string.len(word) >= max then
                    -- 	local before = string.sub(word, 1, math.floor((max - 3) / 2))
                    -- 	word = before .. "..."
                    -- end

                    if
                        entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
                        and string.sub(vim_item.abbr, -1, -1) == '~'
                    then
                        word = word .. '~'
                    end
                    vim_item.abbr = word

                    return vim_item
                end,
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

    luasnip.setup {}
    require('mappings'):load_mappings('luasnip', { silent = true, noremap = true })
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
