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

o.expandtab = true
o.softtabstop = 4
o.tabstop = 4
o.shiftwidth = 4

o.timeoutlen = 400
o.swapfile = false
o.undofile = true
o.scrolloff = 8
o.sidescrolloff = 8

o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldmethod = 'expr'
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
        ['<leader>e'] = function()
            local bufdir = utils.get_curr_bufdir()
            return ':e ' .. bufdir
        end,
    },
}, { noremap = true, expr = true })

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
}, { noremap = true, silent = true })
