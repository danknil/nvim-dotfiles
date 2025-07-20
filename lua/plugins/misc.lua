return {
    {
        'kylechui/nvim-surround',
        event = 'BufEnter',
        opts = {},
    },
    {
        'folke/todo-comments.nvim',
        opts = {},
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    {
        'norcalli/nvim-colorizer.lua',
        opts = { '*' },
    },
    {
        'j-hui/fidget.nvim',
        opts = {},
    },

    {
        'rachartier/tiny-inline-diagnostic.nvim',
        event = 'LspAttach',
        priority = 1000,
        init = function()
            vim.diagnostic.config { virtual_text = false }
        end,
        opts = {
            preset = 'simple',
        },
    },

    {
        'rmagatti/auto-session',
        lazy = false,

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            -- log_level = 'debug',
        },
    },

    'jghauser/mkdir.nvim',
    'tpope/vim-sleuth',
}
