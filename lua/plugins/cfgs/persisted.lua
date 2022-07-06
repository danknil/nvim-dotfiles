require"persisted".setup {
  after_source = function ()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
  end,
  telescope = {
    before_source = function()
      vim.api.nvim_input("<ESC>:%bd<CR>")
    end,
    after_source = function(session)
      print("Loaded session " .. session.name)
    end,
  },
}
