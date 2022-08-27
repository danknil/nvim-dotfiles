local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local util = require 'utils'
local disable_ft = { 'TelescopePrompt', 'netrw' }

augroup('lint', { clear = true })
autocmd('BufWritePost', {
    group = 'lint',
    callback = function()
        require('lint').try_lint()
    end,
})

augroup('numbs', { clear = true })
autocmd('InsertEnter', {
    group = 'numbs',
    callback = function()
        if not vim.tbl_contains(disable_ft, vim.bo.filetype) then
            vim.opt.number = false
            vim.opt.relativenumber = false
        end
    end,
})
autocmd('InsertLeave', {
    group = 'numbs',
    callback = function()
        if not vim.tbl_contains(disable_ft, vim.bo.filetype) then
            vim.opt.number = true
            vim.opt.relativenumber = true
        end
    end,
})

augroup('tabs', { clear = true })
util.autocmd_on_type {
    filetype = 'lua',
    group = 'tabs',
    callback = function()
        vim.opt.expandtab = true
        vim.opt.shiftwidth = 4
        vim.opt.smartindent = true
    end,
}
util.autocmd_on_type {
    filetype = { 'c', 'go' },
    group = 'tabs',
    callback = function()
        vim.opt.expandtab = true
        vim.opt.shiftwidth = 8
        vim.opt.smartindent = true
    end,
}
