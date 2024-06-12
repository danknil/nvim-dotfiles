local utils = require 'utils'
local surround = require 'nvim-surround'

local lspconfig = require 'lspconfig'

lspconfig["nil_ls"].setup(
    require('coq').lsp_ensure_capabilities {
        on_attach = function(client, bufnr) 
            utils.on_lsp_attach(client, bufnr) 
        end,
    }
)
