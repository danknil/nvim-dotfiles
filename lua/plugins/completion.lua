local ls = require 'luasnip'
local maps = require 'mappings'

ls.config.setup {
    region_check_events = 'CursorHold,CursorMoved,InsertEnter',
    delete_check_events = 'TextChanged,InsertLeave',
    enable_autosnippets = true,
}

_G.luasnip = {}
-- _G.luasnip.vars = {
--     username = 'kunzaatko',
--     email = 'martinkunz@email.cz',
--     github = 'https://github.com/kunzaatko',
--     real_name = 'Martin Kunz',
-- }

vim.g.coq_settings = {
    auto_start = 'shut-up',
    xdg = true,
    keymap = {
        recommended = false,
        jump_to_mark = nil,
    },
    clients = {
        ['snippets.enabled'] = false,
        ['tmux.enabled'] = false,
        -- lsp = {
        --     always_on_top = {},
        -- },
    },
    -- match = {},
    -- weights = {},
    -- completion = {
    --     skip_after = { '{', '}', '[', ']' },
    -- },
    display = {
        ['ghost_text.enabled'] = false,
        pum = {
            fast_close = false,
            y_max_len = 8,
            source_context = { '', '' },
            kind_context = { ' ', ' ' },
        },
        preview = {
            border = 'single',
            positions = {
                north = nil,
                south = 1,
                west = 3,
                east = 2,
            },
        },
        icons = {
            mode = 'short',
            mappings = {
                Text = '',
                Method = '',
                Function = '',
                Constructor = '',
                Field = 'ﰠ',
                Variable = '',
                Class = 'ﴯ',
                Interface = '',
                Module = '',
                Property = 'ﰠ',
                Unit = '塞',
                Value = '',
                Enum = '',
                Keyword = '',
                Snippet = '',
                Color = '',
                File = '',
                Reference = '',
                Folder = '',
                EnumMember = '',
                Constant = '',
                Struct = 'פּ',
                Event = '',
                Operator = '',
                TypeParameter = '',
            },
        },
    },
}

maps:load_mappings('luasnip', { noremap = true })
maps:load_mappings('completion', { noremap = true, silent = true, expr = true })
