local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.netrw_banner = 0

opt.laststatus = 3
opt.showmode = false

opt.title = true
opt.clipboard = 'unnamedplus'

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

opt.fillchars = { eob = ' ' }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = 'nv'

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append 'FcsI'

opt.signcolumn = 'yes'
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 8
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.scrolloff = 8
opt.sidescrolloff = 8
