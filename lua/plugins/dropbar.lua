return {
    {
        'Bekaboo/dropbar.nvim',
        init = function()
            require('mappings'):load_mappings('dropbar', { noremap = true })
        end,
    },
}
