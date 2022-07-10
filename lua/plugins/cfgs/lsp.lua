local lspconfig = require "lspconfig"
local lspinstall = require "nvim-lsp-installer"
local mappings = require "core.mappings"

local servers = { "sumneko_lua" }
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(_, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  mappings.load_mappings(mappings.lsp, bufopts)
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end
