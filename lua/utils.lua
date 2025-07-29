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
        local diags = vim.diagnostic.get(0, { severity = level })
        if #diags > 0 then
            return { level, diags }
        end
    end
end

function M.lsp_formatting()
    vim.lsp.buf.format {
        async = true,
        filter = function(client)
            local generators = require('null-ls.generators').get_available(
                vim.bo.filetype,
                require('null-ls.methods').internal.FORMATTING
            )
            -- disable null-ls if no formatters found and enable only null-ls if found at least one
            return #generators > 0 and client.name == 'null-ls' or client.name ~= 'null-ls'
        end,
    }
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

function M.get_curr_bufdir()
    return vim.api.nvim_buf_get_name(0):match '(.-)([^\\/]-%.?([^%.\\/]*))$'
end

-- function M.on_lsp_attach(client, bufnr)
--     local bufopts = { noremap = true, silent = true, buffer = bufnr }
--     require('mappings'):load_mappings('lsp', bufopts)
-- end

-- function M:map(mappings)
--     for mode, mappings_list in pairs(self[mappings]) do
--         for mapping, func in pairs(mappings_list) do
--             vim.keymap.set(mode, mapping, func[1], func[2])
--         end
--     end
-- end

function M.map(mappings, opts)
    for mode, mappings_list in pairs(mappings) do
        for mapping, func in pairs(mappings_list) do
            vim.keymap.set(mode, mapping, func, opts)
        end
    end
end

return M
