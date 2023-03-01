local M = {}

local scan = require 'plenary.scandir'
local plugins = scan.scan_dir(vim.fn.stdpath 'config' .. '/lua/plugins/', { depth = 1 })

for _, v in ipairs(plugins) do
    if not v:match 'init.lua' then
        local filename = v:match('[^/]*.lua$')
        local filename = filename:sub(0, #filename - 4)
        vim.tbl_extend('keep', M, require('plugins.' .. filename))
    end
end

return M
