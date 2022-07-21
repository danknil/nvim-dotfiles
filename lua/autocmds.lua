local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("numbs", { clear = true })
autocmd("InsertEnter", {
  group = "numbs",
  pattern = "*.*",
  command = "set nonumber | set norelativenumber",
})
autocmd("InsertLeave", {
  group = "numbs",
  pattern = "*.*",
  command = "set number | set relativenumber",
})

-- augroup("autowrite", { clear = true })
-- autocmd("InsertLeave", {
--   group = "autowrite",
--   pattern = "*.*",
--   command = "w",
-- })
