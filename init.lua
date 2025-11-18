local utils = require 'utils'
local o = vim.opt
local g = vim.g

g.mapleader = ' '

o.laststatus = 3
o.showmode = false

o.ignorecase = true
o.smartcase = true

o.number = true
o.relativenumber = true
o.numberwidth = 2

o.signcolumn = 'yes'

-- added default tab settings
o.expandtab = true
o.softtabstop = 4
o.tabstop = 4
o.shiftwidth = 4

o.timeoutlen = 400
o.swapfile = false
o.undofile = true
o.scrolloff = 8
o.sidescrolloff = 8

o.foldlevel = 99
o.foldlevelstart = 99

o.list = true
o.listchars = { eol = '↲', tab = '▎ ' }

o.termguicolors = true

o.winborder = 'bold'

require 'autocmds'
require 'plugins'
require 'statusline'

require 'lsp'

vim.cmd [[
	colorscheme kanagawa-dragon
	:hi statusline guibg=none
]]

utils.map({
    n = {
        ['<space>'] = '<cmd>noh<cr>',
        ['<C-c>'] = '<cmd>%y+<cr>',
        ['<Tab>'] = '<cmd>bn<cr>',
        ['<S-Tab>'] = '<cmd>bp<cr>',
        ['<leader>bd'] = '<cmd>bdelete',
        ['<leader>y'] = '"+y',
        ['<leader>Y'] = '"+Y',
        ['<leader>p'] = '"+p',
        ['<leader>P'] = '"+P',
        ['<leader>d'] = '"+d',
        ['C-h'] = '<C-w>h',
        ['C-j'] = '<C-w>j',
        ['C-k'] = '<C-w>k',
        ['C-l'] = '<C-w>l',
    },
    v = {
        ['<leader>y'] = '"+y',
        ['<leader>Y'] = '"+Y',
        ['<leader>p'] = '"+p',
        ['<leader>P'] = '"+P',
        ['<leader>d'] = '"+d',
    },
    x = {
        ['<leader>y'] = '"+y',
        ['<leader>Y'] = '"+Y',
        ['<leader>p'] = '"+p',
        ['<leader>P'] = '"+P',
        ['<leader>d'] = '"+d',
    },
    t = {
        ['C-h'] = '<C-\\><C-o><C-w>h',
        ['C-j'] = '<C-\\><C-o><C-w>j',
        ['C-k'] = '<C-\\><C-o><C-w>k',
        ['C-l'] = '<C-\\><C-o><C-w>l',
    },
}, { noremap = true, silent = true })
