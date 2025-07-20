return {
    {
        'folke/snacks.nvim',
        init = function()
            require('mappings'):load_mappings('picker', { noremap = true })
        end,
        ---@type snacks.Config
        opts = {
            input = {},
            bufdelete = {},
            notifier = {},
            indent = {
                char = '▎',
            },
            picker = {
                layout = {
                    layout = {
                        box = 'vertical',
                        backdrop = false,
                        row = -1,
                        width = 0,
                        height = 0.4,
                        border = 'top',
                        title = ' {title} {live} {flags}',
                        title_pos = 'left',
                        { win = 'input', height = 1, border = 'none' },
                        {
                            box = 'horizontal',
                            { win = 'list',    border = 'none' },
                            -- { win = 'preview', title = '{preview}', width = 0.6, border = 'left' },
                        },
                    },
                },
            },
        },
    },
}
