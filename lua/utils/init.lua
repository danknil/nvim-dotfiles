local autocmd = vim.api.nvim_create_autocmd
local ts = require 'vim.treesitter'
local M = {}

function M.get_highest_error_severity()
    local error_severity = {
        vim.diagnostic.severity.ERROR,
        vim.diagnostic.severity.WARN,
        vim.diagnostic.severity.INFO,
        vim.diagnostic.severity.HINT,
    }

    for _, level in ipairs(error_severity) do
        local diags = vim.diagnostic.get(0, { severity = level })
        if #diags > 0 then
            return { level, diags }
        end
    end
end

function M.autocmd_on_type(tb)
    if type(tb.filetype) == 'string' then
        tb.filetype = { tb.filetype }
    end
    autocmd('BufEnter', {
        group = tb.group,
        callback = function()
            if vim.tbl_contains(tb.filetype, vim.bo.filetype) then
                tb.callback()
            end
        end,
    })
end

function M.pumvisible()
    return vim.fn.pumvisible() ~= 0
end

function M.get_node_at_cursor(parser)
    if not parser then
        return
    end
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    row = row - 1
    col = col - 1

    local root = M.get_root(parser)
    if not root then
        return
    end

    return root:named_descendant_for_range(row, col, row, col)
end

function M.get_root(parser)
    local root_tree = parser:parse()[1]
    return root_tree and root_tree:root()
end


function M.get_complete_selected()
    return vim.fn.complete_info().selected
end

return M
