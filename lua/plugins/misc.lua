local maps = require "mappings"
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local g = vim.g

-- Misc
require "auto-session".setup {
  auto_session_suppress_dirs = { "~/" }
}

-- UI
require "gitsigns".setup {}
require "jabs".setup {}
-- TODO: fix mappings
-- maps.load_mappings("jabs", { silent = true })
require "todo-comments".setup {}

require "indent_blankline".setup {
  show_current_context = true,
  show_current_context_start = false,
  show_current_context_start_on_current_line = false,
  char_list = { "│", "¦", "┆", "┊" },
}

g.cursorword_disable_at_startup = false
g.cursorword_min_width = 3
g.cursorword_max_width = 50
augroup("NvimCursorword", { clear = true })
autocmd("InsertEnter", {
  group = "NvimCursorword",
  command = "CursorWordDisable",
})
autocmd("InsertLeave", {
  group = "NvimCursorword",
  command = "CursorWordEnable",
})

-- Moves
require "nvim-surround".setup {}
require "Comment".setup {}
require "leap".set_default_keymaps()
require("better_escape").setup {
    mapping = {"jk", "jj"}, -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = function()
      return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
    end,
}


