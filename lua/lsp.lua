local utils = require 'utils'
local conform = require 'conform'

-- formatting setup
conform.setup {
    formatters_by_ft = {
        cpp = { 'clang_format', lsp_format = 'fallback' },
        c = { 'clang_format', lsp_format = 'fallback' },
        lua = { 'stylua' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
    },
}
vim.keymap.set('n', '<leader>bf', conform.format, { silent = true, noremap = true })

-- folds setup
require('origami').setup {
    foldtext = {
        gitsignsCount = false,
        lineCount = {
            template = '%d ',
        },
    },
    autoFold = {
        enabled = true,
        kinds = { 'imports' },
    },
}

-- ai assist setup
-- require('codeium').setup {
-- }

-- native lsp setup
vim.lsp.config('*', {
    root_markers = { '.git' },
    capabilities = require('blink.cmp').get_lsp_capabilities({}, true),
})
vim.diagnostic.config {
    virtual_text = { current_line = true },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '■',
            [vim.diagnostic.severity.WARN] = '■',
            [vim.diagnostic.severity.HINT] = '■',
            [vim.diagnostic.severity.INFO] = '■',
        },
    },
}
vim.lsp.enable {
    'qmlls',
    'lua_ls',
    'tinymist',
    'emmet_ls',
    'json_ls',
    'ts_ls',
    'prismals',
}
