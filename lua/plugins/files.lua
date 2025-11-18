local utils = require 'utils'
local yazi = require 'yazi'
local fzf = require 'fzf-lua'

-- mark netrw as loaded so it's not loaded at all.
vim.g.loaded_netrwPlugin = 1

yazi.setup { open_for_directories = true }
fzf.setup { { 'ivy' } }

fzf.register_ui_select()

-- map to fast type curr dir
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
        ['<leader>f'] = function()
            fzf.files()
        end,
        ['<leader>/'] = function()
            fzf.live_grep_native()
        end,
        ['<leader>nh'] = function()
            fzf.helptags()
        end,
        ['<leader>-'] = function()
            yazi.yazi()
        end,
        -- main file mark if exists
        ['<leader>m'] = "'M",
    },
}, { noremap = true, silent = true })
