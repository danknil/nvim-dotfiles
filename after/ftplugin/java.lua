local utils = require 'utils'
local surround = require 'nvim-surround'
local ts = require 'vim.treesitter'

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

local config = {
    cmd = { 'jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

local function get_node_at_cursor()
    local parser = ts.get_parser(vim.api.nvim_get_current_buf(), 'java')
    return utils.get_node_at_cursor(parser)
end

-- local function get_class_name()
--     local node = get_node_at_cursor()
--     if not node then
--         return
--     end
--     while node:type() ~= 'class_declaration' or not node do
--         node = node:parent()
--     end
--     if not node then
--         return
--     end
--     local class_name = ts.query.get_node_text(node:field('name')[0], vim.api.nvim_get_current_buf())
-- end
