local function lspconfig()
    local config = require 'lspconfig'
    local null_ls = require 'null-ls'

    ---@diagnostic disable-next-line: unused-local
    local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        require('mappings'):load_mappings('lsp', bufopts)
    end

    local null_ls_sources = {}

    null_ls.setup { sources = null_ls_sources }
end

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'nvimtools/none-ls.nvim',
            'tamago324/nlsp-settings.nvim',

            { 'ms-jpq/coq_nvim', branch = "coq" },
        },
        config = lspconfig,
    },

    -- language specific
    { 'mfussenegger/nvim-jdtls', lazy = true },
    { 'folke/neodev.nvim', lazy = true },
    { 'simrat39/rust-tools.nvim', lazy = true },
}
