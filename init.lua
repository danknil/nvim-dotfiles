-- setting up vanilla settings
require 'autocmds'
require 'options'

-- installing lazy.nvim
local path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(path) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        path,
    }
end
vim.opt.rtp:prepend(path)

require('lazy').setup 'plugins'

-- setting up vanilla binds
require('mappings'):load_mappings('general', { noremap = true })

require 'statusline'
