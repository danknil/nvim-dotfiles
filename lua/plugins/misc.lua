local maps = require 'mappings'
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local g = vim.g

-- Misc
require('stabilize').setup()

-- UI
require('gitsigns').setup {}
require('todo-comments').setup {}

require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = false,
    show_current_context_start_on_current_line = false,
    char_list = { '│', '¦', '┆', '┊' },
}

-- Moves
require('Comment').setup {}
require('leap').set_default_keymaps()
require('better_escape').setup {
    mapping = { 'jk', 'jj' }, -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
    end,
}
