local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.netrw_banner = 0

opt.laststatus = 3
opt.showmode = false

opt.title = true

opt.fillchars = { eob = ' ' }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = 'nv'
opt.mousemodel = 'extend'

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append 'FcsIW'

-- fold settings
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldmethod = 'expr'
opt.foldlevelstart = 99

opt.signcolumn = 'yes'
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4

opt.timeoutlen = 400
opt.undofile = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.list = true
opt.listchars = { trail = '·', eol = '↲', space = '·', tab = '▎·' }

-- tmux setup
opt.termguicolors = true
vim.cmd [[
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
]]
