local M = {}

M.lsp = {
  n = {
    ["gD"] = vim.lsp.buf.declaration,
    ["gd"] = vim.lsp.buf.definition,
    ["K"] = vim.lsp.buf.hover,
    ["gi"] = vim.lsp.buf.implementation,
    ["<C-k>"] = vim.lsp.buf.signature_help,
    ["<leader>wa"] = vim.lsp.buf.add_workspace_folder,
    ["<leader>wr"] = vim.lsp.buf.remove_workspace_folder,
    ["<leader>wl"] = function ()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    ["<leader>D"] = vim.lsp.buf.type_definition,
    ["<leader>rn"] = vim.lsp.buf.rename,
    ["<leader>ca"] = vim.lsp.buf.code_action,
    ["gr"] = vim.lsp.buf.references,
    ["<leader>f"] = vim.lsp.buf.formatting,
  }
}

M.bufferline = {
  n = {
    ["<S-Tab>"] = "<Plug>(cokeline-focus-prev)",
    ["<Tab>"] = "<Plug>(cokeline-focus-next)",
    ["<leader>p"] = "<Plug>(cokeline-switch-prev)",
    ["<leader>n"] = "<Plug>(cokeline-switch-next)",
  }

}

M.telescope = {
  n = {
    ["<leader>tf"] = "<cmd>lua require'telescope.builtin'.find_files()<cr>",
    ["<leader>tt"] = "<cmd>lua require'telescope.builtin'.treesitter()<cr>",
    ["<leader>tp"] = "<cmd>lua require'telescope'.extensions.project.project()<cr>",
  }
}

M.dirbuf = {
  n = {
    ["<leader>e"] = function ()
      if vim.bo.filetype == 'dirbuf' then
        vim.cmd [[ DirbufQuit ]]
      else
        vim.cmd [[ Dirbuf ]]
      end
    end,
  }
}

return M
