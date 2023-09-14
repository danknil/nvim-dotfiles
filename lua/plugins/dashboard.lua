return {
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {}
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    },
}
