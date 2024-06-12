return {
    {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        lazy = false,
        config = function()
            require('mappings'):load_mappings('coq', { noremap = true, silent = true, expr = true })
        end,
        dependencies = {
            { 'ms-jpq/coq.artifacts',  branch = 'artifacts' },
            { 'ms-jpq/coq.thirdparty', branch = '3p' },
        },
    },
}
