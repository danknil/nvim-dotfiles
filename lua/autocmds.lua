local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local disable_ft = { 'TelescopePrompt', 'netrw' }

local function autocmd_on_type(tb)
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

-- augroup("autowrite", { clear = true })
-- autocmd("InsertLeave", {
--   group = "autowrite",
--   pattern = "*.*",
--   command = "w",
-- })

augroup('tabs', { clear = true })
autocmd_on_type {
    filetype = 'lua',
    group = 'tabs',
    callback = function()
        vim.opt.expandtab = true
        vim.opt.shiftwidth = 4
        vim.opt.smartindent = true
    end,
}
autocmd_on_type {
    filetype = { 'c', 'go' },
    group = 'tabs',
    callback = function()
        vim.opt.expandtab = true
        vim.opt.shiftwidth = 8
        vim.opt.smartindent = true
    end,
}
