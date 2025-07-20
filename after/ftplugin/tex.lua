---@diagnostic disable: unused-local, lowercase-global
local ts = require 'vim.treesitter'
local utils = require 'utils'
local surround = require 'nvim-surround'

local MATH_NODES = {
    displayed_equation = true,
    inline_formula = true,
    math_environment = true,
}

local function get_node_at_cursor()
    local parser = ts.get_parser(vim.api.nvim_get_current_buf(), 'latex')
    return utils.get_node_at_cursor(parser)
end

function in_text(check_parent)
    local node = get_node_at_cursor()
    while node do
        if node:type() == 'text_mode' then
            if check_parent then
                -- For \text{}
                local parent = node:parent()
                if parent and MATH_NODES[parent:type()] then
                    return false
                end
            end

            return true
        elseif MATH_NODES[node:type()] then
            return false
        end
        node = node:parent()
    end
    return true
end

function M.in_mathzone()
    local node = get_node_at_cursor()
    while node do
        if node:type() == 'text_mode' then
            return false
        elseif MATH_NODES[node:type()] then
            return true
        end
        node = node:parent()
    end
    return false
end

surround.buffer_setup {
    surrounds = {
        ['$'] = {
            add = { '$', '$' },
            find = '$*$',
            delete = '^(.)().-(.)()$',
        },
    },
    aliases = {},
}

