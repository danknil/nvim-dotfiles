local lspconfig = require 'lspconfig'
local formatter_util = require 'formatter.util'
local maps = require 'mappings'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    maps:load_mappings('lsp', bufopts)
end

local function setup_lua_lsp()
    if vim.fn.stdpath 'config' == vim.fn.getcwd() then
        vim.cmd [[ packadd lua-dev.nvim ]]

        local luadev = require('lua-dev').setup {
            lsp_config = {
                capabilities = capabilities,
                on_attach = on_attach,
            },
        }
        lspconfig.sumneko_lua.setup(luadev)
    else
        lspconfig.sumneko_lua.setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end
end

vim.api.nvim_create_autocmd('DirChanged', {
    pattern = 'global',
    callback = setup_lua_lsp,
})
setup_lua_lsp()

lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
lspconfig.ccls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
lspconfig.texlab.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
lspconfig.jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- local c_sources = {
--     nls.builtins.formatting.astyle,
-- }
--
-- local go_sources = {
--     nls.builtins.formatting.golines,
--     nls.builtins.formatting.goimports,
--     nls.builtins.formatting.gofmt,
-- }
-- local latex_sources = {
--     nls.builtins.formatting.latexindent,
-- }
-- local lua_sources = {
--     nls.builtins.formatting.stylua,
-- }

require('formatter').setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {
            require('formatter.filetypes.lua').stylua,
        },
        go = {
            require('formatter.filetypes.go').goimports,
            require('formatter.filetypes.go').golines,
            require('formatter.filetypes.go').gofumpt,
        },
        c = {
            require('formatter.filetypes.c').astyle,
        },
        markdown = {
            require('formatter.filetypes.markdown').prettierd,
        },
        ['*'] = {
            require('formatter.filetypes.any').remove_trailing_whitespace,
        },
    },
}

require('lint').linters_by_ft = {
    lua = {},
    go = { 'revive' },
    c = {},
    tex = { 'vale' },
    markdown = { 'markdownlint', 'vale' },
}

maps:load_mappings('lsp', { noremap = true })
