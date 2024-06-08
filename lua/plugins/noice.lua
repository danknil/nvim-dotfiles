return {
    {
        'folke/noice.nvim',
        config = function()
            require('noice').setup {
                cmdline = {
                    format = {
                        search_down = {
                            view = 'cmdline',
                        },
                        search_up = {
                            view = 'cmdline',
                        },
                    },
                },
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                        ['vim.lsp.util.stylize_markdown'] = true,
                        ['cmp.entry.get_documentation'] = true,
                    },
                },
                routes = {
                    {
                        filter = {
                            event = 'msg_show',
                            kind = '',
                            find = 'written',
                        },
                        opts = { skip = true },
                    },
                },
                views = {
                    cmdline_popup = {
                        border = {
                            style = 'none',
                            padding = { 2, 3 },
                        },
                        filter_options = {},
                        win_options = {
                            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
                        },
                    },
                },
            }
        end,
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
            'nvim-treesitter/nvim-treesitter',
        },
    },
}
