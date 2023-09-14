local function lspconfig()
    local config = require 'lspconfig'
    local masonlsp = require 'mason-lspconfig'
    local null_ls = require 'null-ls'
    require('neoconf').setup {}
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    ---@diagnostic disable-next-line: unused-local
    local on_attach = function(client, bufnr)
        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        require('mappings'):load_mappings('lsp', bufopts)
    end

    -- FIXME: setup neodev by ft
    require('neodev').setup {}
    masonlsp.setup_handlers {
        function(server_name)
            config[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
        end,
    }

    local null_ls_sources = {
        -- all files
        null_ls.builtins.formatting.trim_whitespace,
        -- lua
        null_ls.builtins.formatting.stylua,
        -- go
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.diagnostics.revive,
        -- c
        null_ls.builtins.formatting.astyle.with {
            filetypes = { 'c' },
        },
        -- rust
        null_ls.builtins.formatting.rustfmt,
        -- markdown
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.markdownlint,
    }

    null_ls.setup { sources = null_ls_sources }
end

return {
    {
        'neovim/nvim-lspconfig',
        event = 'UIEnter',
        dependencies = {
            'folke/neoconf.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'tamago324/nlsp-settings.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = lspconfig,
    },

    -- language specific
    -- TODO: change lazy to ft event
    { 'mfussenegger/nvim-jdtls', lazy = true },
    { 'folke/neodev.nvim', lazy = true },
    { 'simrat39/rust-tools.nvim', lazy = true },
}
