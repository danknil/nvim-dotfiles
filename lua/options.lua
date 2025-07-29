local o = vim.opt
local g = vim.g

g.mapleader = ' '

o.laststatus = 3
o.showmode = false

o.title = true

o.ignorecase = true
o.smartcase = true

-- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2

-- disable nvim intro
o.shortmess:append 'FcsIW'

o.signcolumn = 'yes'
o.tabstop = 4

o.timeoutlen = 400
o.undofile = true
o.scrolloff = 8
o.sidescrolloff = 8

o.list = true
o.listchars = { trail = '·', eol = '↲', space = '·', tab = '▎·' }

-- tmux setup
o.termguicolors = true
-- vim.cmd [[
--     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
-- ]]
