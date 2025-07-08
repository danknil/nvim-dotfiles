local function lspconfig()
    local lspconfig = require 'lspconfig'
    local mason_lspconfig = require 'mason-lspconfig'
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

    -- for _, server in ipairs(mason_lspconfig.get_available_servers()) do
    -- end
end

return {
    {
        'williamboman/mason.nvim',
        config = true,
        dependencies = {
            {
                'williamboman/mason-lspconfig.nvim',
                opts = {
                    automatic_enable = true,
                },
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        dependencies = {
            -- 'nvimtools/none-ls.nvim',
            'nvim-lua/plenary.nvim',
            'tamago324/nlsp-settings.nvim',
            'saghen/blink.cmp',
            'williamboman/mason-lspconfig.nvim',
        },
        config = lspconfig,
    },

    -- language specific
    { 'mfussenegger/nvim-jdtls', lazy = true },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
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
