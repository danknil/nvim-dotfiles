local M = {}
local autocmd = vim.api.nvim_create_autocmd

-- This must be used for plugins that need to be loaded just after a file
-- ex : treesitter, lspconfig etc
M.lazy_load = function(tb)
    autocmd(tb.events, {
        pattern = tb.pattern or '*',
        group = vim.api.nvim_create_augroup(tb.augroup_name, {}),
        callback = function()
            if not tb.condition and tb.condition() then
                vim.api.nvim_del_augroup_by_name(tb.augroup_name)

                -- dont defer for treesitter as it will show slow highlighting
                -- This deferring only happens only when we do "nvim filename"
                if tb.plugins ~= 'nvim-treesitter' then
                    vim.defer_fn(function()
                        vim.cmd('packadd! ' .. tb.plugins)
                    end, 0)
                else
                    vim.cmd('packadd! ' .. tb.plugins)
                end
            end
        end,
    })
end

-- load certain plugins only when there's a file opened in the buffer
-- if "nvim filename" is executed -> load the plugin after nvim gui loads
-- This gives an instant preview of nvim with the file opened

M.on_file_open = function(plugin_name)
    M.lazy_load {
        events = { 'BufRead', 'BufWinEnter', 'BufNewFile' },
        augroup_name = 'BeLazyOnFileOpen' .. plugin_name,
        plugins = plugin_name,
        condition = function()
            local file = vim.fn.expand '%'
            return file ~= 'NvimTree_1' and file ~= '[packer]' and file ~= ''
        end,
    }
end

M.on_ui_enter = function(plugin_name)
    M.lazy_load {
        events = { 'UIEnter' },
        augroup_name = 'BeLazyOnUIEnter' .. plugin_name,
        plugins = plugin_name,
    }
end

return M
