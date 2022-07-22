local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('numbs', { clear = true })
autocmd('InsertEnter', {
    group = 'numbs',
    pattern = '*.*',
    command = 'set nonumber | set norelativenumber',
})
autocmd('InsertLeave', {
    group = 'numbs',
    pattern = '*.*',
    command = 'set number | set relativenumber',
})

-- augroup("autowrite", { clear = true })
-- autocmd("InsertLeave", {
--   group = "autowrite",
--   pattern = "*.*",
--   command = "w",
-- })

augroup('tabs', { clear = true })
autocmd('BufEnter', {
    group = 'tabs',
    callback = function()
        if vim.tbl_contains({ 'lua' }, vim.bo.filetype) then
            vim.opt.expandtab = true
            vim.opt.shiftwidth = 4
            vim.opt.smartindent = true
        end
    end,
})
autocmd('BufEnter', {
    group = 'tabs',
    callback = function()
        if vim.tbl_contains({ 'go' }, vim.bo.filetype) then
            vim.opt.expandtab = true
            vim.opt.shiftwidth = 8
            vim.opt.smartindent = true
        end
    end,
})
