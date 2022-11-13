local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local util = require 'utils'
local job = require 'plenary.job'

local disable_ft = { 'TelescopePrompt', 'netrw', 'zsh' }

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

-- augroup('autogen', { clear = true })
-- util.autocmd_on_type {
--     filetype = 'tex',
--     group = 'autogen',
--     callback = function()
--         _G.latexmkjob = job:new {
--             command = 'latexmk',
--             args = { '-pvc', '-pdflua', '-view=none' },
--             cwd = vim.loop.cwd(),
--         }
--         _G.latexmkjob:start()
--     end,
-- }
-- autocmd('VimLeavePre', {
--     group = 'autogen',
--     callback = function()
--         if _G.latexmkjob then
--             _G.latexmkjob:shutdown()
--         end
--     end,
-- })
