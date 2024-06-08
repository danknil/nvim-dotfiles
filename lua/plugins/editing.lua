return {
    {
        'numToStr/Comment.nvim',
        event = 'BufEnter',
        config = function() require('Comment').setup() end,
    },
    {
        'kylechui/nvim-surround',
        event = 'BufEnter',
        config = function() require('nvim-surround').setup() end,
    },

    'jghauser/mkdir.nvim',
    'tpope/vim-sleuth',
}
