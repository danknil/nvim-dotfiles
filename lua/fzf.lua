local utils = require 'utils'
local fzf = require 'fzf-lua'

fzf.setup {
    { 'ivy' },
}

fzf.register_ui_select()

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
    },
}, { noremap = true, silent = true })
