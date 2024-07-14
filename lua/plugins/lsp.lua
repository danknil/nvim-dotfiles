local function lspconfig()
    local config = require 'lspconfig'
    local null_ls = require 'null-ls'

    ---@diagnostic disable-next-line: unused-local
    local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        require('mappings'):load_mappings('lsp', bufopts)
    end

    vim.g.coq_settings.auto_start = 'shut-up'

    local null_ls_sources = {
        -- any
        null_ls.builtins.diagnostics.trail_space,
        null_ls.builtins.diagnostics.todo_comments,
        -- nix
        null_ls.builtins.formatting.alejandra,
        null_ls.builtins.diagnostics.statix,
        null_ls.builtins.code_actions.statix,
        -- lua
        null_ls.builtins.formatting.stylua,
        -- markdown
        null_ls.builtins.diagnostics.vale,
        -- web(+markdown)
        null_ls.builtins.formatting.prettierd,
    }

    null_ls.setup {
        sources = null_ls_sources,
        on_attach = on_attach,
    }
end

return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        dependencies = {
            'nvimtools/none-ls.nvim',
            'nvim-lua/plenary.nvim',
            'tamago324/nlsp-settings.nvim',
        },
        config = lspconfig,
    },

    -- language specific
    { 'mfussenegger/nvim-jdtls', lazy = true },
    { 'simrat39/rust-tools.nvim', lazy = true },
}
