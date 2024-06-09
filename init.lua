-- gruvbox material light medium, you can change it to your needs
_G.colorscheme = {
    base00 = '#fbf1c7',
    base01 = '#f2e5bc',
    base02 = '#d5c4a1',
    base03 = '#bdae93',
    base04 = '#665c54',
    base05 = '#654735',
    base06 = '#3c3836',
    base07 = '#282828',
    base08 = '#c14a4a',
    base09 = '#c35e0a',
    base0A = '#b47109',
    base0B = '#6c782e',
    base0C = '#4c7a5d',
    base0D = '#45707a',
    base0E = '#945e80',
    base0F = '#e78a4e',
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

