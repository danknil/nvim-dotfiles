return {
    {
       'yorickpeterse/nvim-pqf',
       config = function()
           require('pqf').setup()
           require('mappings'):load_mappings('quickfix', { noremap = true, silent = true })
       end
    },
}
