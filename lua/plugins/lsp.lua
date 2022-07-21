local lspconfig = require "lspconfig"
local lspinstall = require "nvim-lsp-installer"
local maps = require "mappings"

lspinstall.setup {
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = " ",
      server_pending = " ",
      server_uninstalled = " ﮊ",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  },
  max_concurrent_installers = 10,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
capabilities = require "cmp_nvim_lsp".update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  require "nvim-navic".attach(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  maps:load_mappings("lsp", bufopts)
end

local luadev = require "lua-dev".setup {
  lsp_config = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
}

lspconfig.sumneko_lua.setup(luadev)
