local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local disable_ft = { 'TelescopePrompt', 'netrw', 'zsh', 'oil' }

-- auto mkdir
-- augroup('mkdir', { clear = true })
-- autocmd('BufWritePre', {
--     group = 'mkdir',
--     pattern = '*',
--     callback = function()
--         local file_path = vim.fn.expand('%:p')
--         local dir_path = vim.fn.fnamemodify(file_path, ':h')
--
--         if not vim.loop.fs_stat(dir_path) then
--             vim.fn.mkdir(dir_path, 'p')
--         end
--     end
-- })
