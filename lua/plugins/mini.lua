---@diagnostic disable: undefined-field
return {
    {
        'echasnovski/mini.nvim',
        config = function()
            -- setting up colorscheme
            -- require('mini.base16').setup {
            --     palette = colorscheme,
            --     use_cterm = true,
            -- }

            -- require('mini.statusline').setup {
            --     content = {
            --         -- Content for active window
            --         active = function()
            --             local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
            --             local diff = MiniStatusline.section_diff { trunc_width = 75 }
            --             local location = MiniStatusline.section_location { trunc_width = 9999 }
            --             local search = MiniStatusline.section_searchcount { trunc_width = 75 }
            --             local filename = MiniStatusline.section_filename { trunc_width = 75 }
            --
            --
            --             return MiniStatusline.combine_groups {
            --                 { hl = mode_hl, strings = { mode } },
            --                 { hl = 'MiniStatuslineFilename', strings = { fileinfo } },
            --                 { hl = 'MiniStatuslineDevinfo', strings = { diff } },
            --                 '%<', -- Mark general truncate point
            --                 '%=', -- End left alignment
            --                 { hl = mode_hl, strings = { search, location } },
            --             }
            --         end,
            --
            --         inactive = function()
            --             local filename = MiniStatusline.section_filename { trunc_width = 140 }
            --
            --             return MiniStatusline.combine_groups {
            --                 '%<', -- Mark general truncate point
            --                 { hl = 'MiniStatuslineFilename', strings = { filename } },
            --                 '%=', -- End left alignment
            --             }
            --         end,
            --     },
            --
            --     use_icons = false,
            --     set_vim_settings = false,
            -- }

            -- require('mini.tabline').setup {
            --     -- Whether to show file icons (requires 'nvim-tree/nvim-web-devicons')
            --     show_icons = false,
            --
            --     -- Function which formats the tab label
            --     -- By default surrounds with space and possibly prepends with icon
            --     format = function(buf_id, label)
            --         local suffix = vim.bo[buf_id].modified and ' +' or ' '
            --         return string.format(' %s%s', label, suffix)
            --     end,
            --
            --     -- Whether to set Vim's settings for tabline (make it always shown and
            --     -- allow hidden buffers)
            --     set_vim_settings = true,
            --
            --     -- Where to show tabpage section in case of multiple vim tabpages.
            --     -- One of 'left', 'right', 'none'.
            --     tabpage_section = 'left',
            -- }

            require('mini.indentscope').setup {
                draw = {
                    delay = 50,
                    animation = require('mini.indentscope').gen_animation.none(),
                },
                symbol = '▎',
            }

            -- mini.pick setup
            require('mini.pick').setup {}
            vim.ui.select = MiniPick.ui_select
            require('mappings'):load_mappings('minipick', { noremap = true, silent = true })

            require('mini.ai').setup {}
            require('mini.bufremove').setup {}
            require('mini.notify').setup {}
            require('mini.comment').setup {}
            require('mini.cursorword').setup {}
            require('mini.git').setup {}
            require('mini.diff').setup {}
            require('mini.extra').setup {}
        end,
    },
}
