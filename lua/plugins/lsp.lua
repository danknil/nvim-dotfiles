local function lspconfig()
    local lspconfig = require 'lspconfig'
    local capabilities = require('blink.cmp').get_lsp_capabilities(lspconfig.util.default_config.capabilities)

    ---@diagnostic disable-next-line: unused-local
    local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        require('mappings'):load_mappings('lsp', bufopts)
    end

    vim.lsp.config('*', {
        root_markers = { '.git' },
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'tamago324/nlsp-settings.nvim',
            'saghen/blink.cmp',
        },
        config = lspconfig,
    },

    -- language specific
    { 'mfussenegger/nvim-jdtls', lazy = true },
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            },
        },
    },
}
