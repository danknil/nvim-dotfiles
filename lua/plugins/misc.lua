return {
    {
        'kylechui/nvim-surround',
        event = 'BufEnter',
        config = function()
            require('nvim-surround').setup()
        end,
    },
    {
        'folke/todo-comments.nvim',
        opts = {},
    },
    {
        'stevearc/oil.nvim',
        config = function()
            require('oil').setup {}
        end,
        -- Optional dependencies
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    'jghauser/mkdir.nvim',
    'tpope/vim-sleuth',
}
