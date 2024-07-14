return {
    {
        'Bekaboo/dropbar.nvim',
        config = function()
            require('mappings'):load_mappings('dropbar', { noremap = true })
        end
    },
}
