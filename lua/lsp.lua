local none_ls = require 'null-ls'
local utils = require 'utils'

-- setup neovim lsp
none_ls.setup {
    debounce = 250,
    log_level = 'warn',
    notify_format = '[null-ls] %s',
    sources = {
        none_ls.builtins.formatting.clang_format,
        none_ls.builtins.formatting.prettierd,
        none_ls.builtins.formatting.stylua,
        none_ls.builtins.formatting.shellharden,
    },
}

vim.lsp.config('*', {
    root_markers = { '.git' },
    -- capabilities = capabilities,
    on_attach = function(client, bufnr)
        -- TODO: vanilla snippet setup
        -- vim.keymap.set({ 'i', 's' }, '<Tab>', function()
        --     if vim.snippet.active { direction = 1 } then
        --         return '<Cmd>lua vim.snippet.jump(1)<CR>'
        --     else
        --         return '<Tab>'
        --     end
        -- end, { expr = true, silent = true })


        utils.map({
            i = {
                ['C-k'] = vim.lsp.buf.signature_help,
            },
            n = {
                ['<leader>rn'] = vim.lsp.buf.rename,
                ['<leader>ca'] = vim.lsp.buf.code_action,
                ['<leader>lr'] = vim.lsp.buf.references,
                ['<leader>li'] = vim.lsp.buf.implementation,
                ['<leader>lt'] = vim.lsp.buf.type_definition,
                ['<leader>O'] = vim.lsp.buf.document_symbol,
                ['<leader>lq'] = vim.diagnostic.setqflist,
                ['<leader>bf'] = utils.lsp_formatting,
            },
        }, { noremap = true, silent = true, buffer = bufnr })
    end,
})

vim.diagnostic.config { virtual_text = true }

vim.lsp.enable {
    'qmlls',
    'lua_ls',
}
