local lspconfig = require 'lspconfig'
local masonlsp = require 'mason-lspconfig'
local null_ls = require 'null-ls'
local maps = require 'mappings'

require('nlspsettings').setup {
    config_home = vim.fn.stdpath 'config' .. '/nlsp-settings',
    local_settings_dir = '.nlsp-settings',
    local_settings_root_markers_fallback = { '.git' },
    append_default_schemas = true,
    loader = 'json',
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
capabilities.textDocument.completion.completionItem.snippetSupport = true

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    maps:load_mappings('lsp', bufopts)
end

require('neodev').setup {}
masonlsp.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end,
}

local null_ls_sources = {
    -- all files
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.completion.luasnip,
    -- lua
    null_ls.builtins.formatting.stylua,
    -- go
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.diagnostics.revive,
    -- c and c#
    null_ls.builtins.formatting.astyle.with {
        filetypes = { 'c', 'cs' },
    },
    -- rust
    null_ls.builtins.formatting.rustfmt,
    -- markdown
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.markdownlint,
}
null_ls.setup { sources = null_ls_sources }
