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
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {}
            require('mappings'):load_mappings('trouble', { noremap = true, silent = true })
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

    'jghauser/mkdir.nvim',
    'tpope/vim-sleuth',
}
