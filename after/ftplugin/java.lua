local o = vim.opt_local
local utils = require 'utils'
local surround = require 'nvim-surround'

o.expandtab = true
o.shiftwidth = 4
o.smartindent = true

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

local config = {
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
