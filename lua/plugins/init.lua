local M = {}
local plugin_lists = {
    'theme',
    'treesitter',
    'neorg',
    'lsp',
    'dap',
    'mason',
    'ui',
    'git',
    'statusline',
    'telescope',
    'dashboard',
    'editing',
    'completion',
}

for _, v in ipairs(plugin_lists) do
    vim.tbl_extend('keep', M, require('plugins.' .. v))
end

return M
