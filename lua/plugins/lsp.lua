local lspconfig = require 'lspconfig'
local masonlsp = require 'mason-lspconfig'
-- local formatter_util = require 'formatter.util'
local maps = require 'mappings'
local util = require 'formatter.util'

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
-- local function setup_lua_lsp()
--     if vim.fn.stdpath 'config' == vim.fn.getcwd() then
--         vim.cmd [[ packadd lua-dev.nvim ]]
--
--         local luadev = require('lua-dev').setup {
--             lsp_config = {
--                 capabilities = capabilities,
--                 on_attach = on_attach,
--             },
--         }
--         lspconfig.sumneko_lua.setup(luadev)
--     else
--         lspconfig.sumneko_lua.setup {
--             capabilities = capabilities,
--             on_attach = on_attach,
--         }
--     end
-- end
-- vim.api.nvim_create_autocmd('DirChanged', {
--     pattern = 'global',
--     callback = setup_lua_lsp,
-- })

masonlsp.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end,
    -- ['sumneko_lua'] = setup_lua_lsp,
}

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
        java = {
            util.withl(require('formatter.defaults').astyle, 'java'),
        },
        c = {
            require('formatter.filetypes.c').astyle,
        },
        rust = {
            require('formatter.filetypes.rust').rustfmt,
        },
        cs = {
            require('formatter.filetypes.cs').astyle,
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
