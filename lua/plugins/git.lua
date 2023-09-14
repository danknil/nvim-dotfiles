return {
    {
        'TimUntersberger/neogit',
        config = function()
            require('neogit').setup {}
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
}
