return {
    {
        'utilyre/barbecue.nvim',
        name = 'barbecue',

        dependencies = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons', -- optional dependency
        },
        after = {
            'echasnovski/mini.nvim',
        },
        config = function()
            -- triggers CursorHold event faster
            vim.opt.updatetime = 200

            require('barbecue').setup {
                create_autocmd = false, -- prevent barbecue from updating itself automatically
            }

            vim.api.nvim_create_autocmd({
                'WinResized',
                'BufWinEnter',
                'CursorHold',
                'InsertLeave',
            }, {
                group = vim.api.nvim_create_augroup('barbecue.updater', {}),
                callback = function()
                    require('barbecue.ui').update()
                end,
            })
        end,
    },
}
