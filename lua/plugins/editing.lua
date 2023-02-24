return {
    {
        'numToStr/Comment.nvim',
        event = 'BufEnter',
        config = require('Comment').setup,
    },
    {
        'monaqa/dial.nvim',
        event = 'BufEnter',
        config = function()
            require('mappings'):load_mappings('dial', { silent = true })
        end,
    },
    {
        'kylechui/nvim-surround',
        event = 'BufEnter',
        config = require('nvim-surround').setup,
    },
    {
        'ggandor/leap.nvim',
        event = 'BufEnter',
        dependencies = {
            'tpope/vim-repeat',
            'ggandor/leap-ast.nvim',
        },
        config = function()
            require('leap').set_default_keymaps()
            require('mappings'):load_mappings('leap_ast', { silent = true })
        end,
    },
    {
        'smjonas/inc-rename.nvim',
        event = 'BufEnter',
        config = function()
            require('inc_rename').setup()
        end,
    },

    'jghauser/mkdir.nvim',
    'tpope/vim-sleuth',
}
