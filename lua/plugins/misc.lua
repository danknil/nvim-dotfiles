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
        config = function()
            require('todo-comments').setup {}
            require('mappings'):load_mappings('todo', { noremap = true, silent = true })
        end,
    },
    {
        'stevearc/oil.nvim',
        config = function()
            require('oil').setup {}
        end,
        -- Optional dependencies
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        'cbochs/grapple.nvim',
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', lazy = true },
        },
        config = function()
            require('mappings'):load_mappings('grapple', { noremap = true, silent = true })
        end,
    },

    'jghauser/mkdir.nvim',
    'tpope/vim-sleuth',
}
