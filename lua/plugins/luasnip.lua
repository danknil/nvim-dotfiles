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
maps:load_mappings('luasnip', { noremap = true })
