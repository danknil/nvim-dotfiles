return {
    {
        'ramojus/mellifluous.nvim',
        priority = 1000000,
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
            -- require('mellifluous').setup {} -- optional, see configuration section.
            vim.cmd [[ colorscheme mellifluous ]]
        end,
    },
}
