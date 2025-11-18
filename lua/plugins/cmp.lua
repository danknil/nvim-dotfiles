require('luasnip').setup {}
require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snips/' }
require('blink.cmp').setup {
    completion = {
        accept = { auto_brackets = { enabled = false } },
        keyword = { range = 'full' },
        ghost_text = {
            enabled = true,
            show_with_selection = false,
            show_without_selection = true,
            show_with_menu = false,
            show_without_menu = true,
        },
        list = { selection = { preselect = false, auto_insert = true } },
        menu = {
            border = 'none',
            draw = {
                gap = 6,
                treesitter = { 'lsp' },
                columns = {
                    { 'kind_icon', 'label', gap = 2 },
                    { 'label_description', 'kind', gap = 1 },
                },
            },
        },
    },
    snippets = {
        preset = 'luasnip',
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
}
