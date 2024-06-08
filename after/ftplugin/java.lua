local utils = require 'utils'
local surround = require 'nvim-surround'
local ts = require 'vim.treesitter'

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
