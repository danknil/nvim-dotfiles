local autocmd = vim.api.nvim_create_autocmd
local calculate_comment_string = require('Comment.ft').calculate
local comm = require('Comment.utils')
local M = {}

--- Get the comment string {beg,end} table
---@param ctype integer 1 for `line`-comment and 2 for `block`-comment
---@return table comment_strings {begcstring, endcstring}
function M.get_cstring(ctype)
  -- use the `Comments.nvim` API to fetch the comment string for the region (eq. '--%s' or '--[[%s]]' for `lua`)
  local cstring = calculate_comment_string { ctype = ctype, range = comm.get_region() } or vim.bo.commentstring
  -- as we want only the strings themselves and not strings ready for using `format` we want to split the left and right side
  local left, right = comm.unwrap_cstr(cstring)
  -- create a `{left, right}` table for it
  return { left, right }
end

function M.get_highest_error_severity()
    local error_severity = {
        vim.diagnostic.severity.ERROR,
        vim.diagnostic.severity.WARN,
        vim.diagnostic.severity.INFO,
        vim.diagnostic.severity.HINT,
    }

    for _, level in ipairs(error_severity) do
        local diags = vim.diagnostic.get(0, { severity = { min = level } })
        if #diags > 0 then
            return level, diags
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

return M
