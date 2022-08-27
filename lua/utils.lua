local autocmd = vim.api.nvim_create_autocmd
local M = {}

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
