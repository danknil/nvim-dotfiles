local utils = require 'utils'
local surround = require 'nvim-surround'

-- luasnip
local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local extras = require 'luasnip.extras'
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require('luasnip.extras.postfix').postfix

-- surround.buffer_setup {
--     surrounds = {
--         ['$'] = {
--             add = { '$', '$' },
--             find = '\$*\$',
--             delete = '^(.)().-(.)()$',
--         },
--     },
--     aliases = {},
-- }

ls.add_snippets('c', {
    s(
        'func',
        fmta(
            [[
<>
<>(<>) {
        <>
}
    ]],
            { i(1), i(2), i(3), i(0) }
        )
    ),
})
