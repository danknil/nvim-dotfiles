-- gruvbox material light medium, you can change it to your needs
_G.colorscheme = {
    base00 = '#ECEDF3',
    base01 = '#CBCCD1',
    base02 = '#DFE0E5',
    base03 = '#9699A3',
    base04 = '#4C505E',
    base05 = '#4C505E',
    base06 = '#1A1B26',
    base07 = '#1A1B26',
    base08 = '#8C4351',
    base09 = '#965027',
    base0A = '#8F5E15',
    base0B = '#33635C',
    base0C = '#0F4B6E',
    base0D = '#34548A',
    base0E = '#5A4A78',
    base0F = '#655259',
}

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
