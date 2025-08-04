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
        none_ls.builtins.formatting.typstyle,
    },
}

vim.lsp.config('*', {
    root_markers = { '.git' },
    -- capabilities = capabilities,
    on_attach = function(client, bufnr)
        vim.keymap.set({ 'i', 's' }, '<C-l>', function()
            if client.name == 'emmet_ls' then
                local abbreviation, indent = vim.text.indent(0, vim.api.nvim_get_current_line())
                local current_row = vim.api.nvim_win_get_cursor(0)[1]

                vim.lsp.buf_request(
                    0,
                    ---@diagnostic disable-next-line: param-type-mismatch
                    'emmet/expandAbbreviation',
                    { abbreviation = abbreviation, language = vim.bo.filetype, options = {} },
                    --- @param result string
                    function(_, result, _, _)
                        local res, _ = vim.text.indent(vim.bo.tabstop * indent, result)
                        local lines = vim.split(res, '\n')
                        vim.api.nvim_buf_set_lines(0, current_row - 1, current_row, false, lines)
                    end
                )

                return ''
            end
        end, { expr = true, silent = true })

        -- vim.keymap.set({ 'i', 's' }, '<C-l>', function()
        --     if client.name == 'emmet_ls' then
        --         local label = vim.trim(vim.api.nvim_get_current_line())
        --         local current_row = vim.api.nvim_win_get_cursor(0)[1]
        --
        --         vim.lsp.buf_request(
        --             0,
        --             "completionItem/resolve",
        --             { label = label },
        --             function(err, item, _, _)
        --                 if err then
        --                     return
        --                 end
        --
        --             end
        --         )
        --
        --         return ''
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
vim.cmd 'set completeopt+=noselect'

vim.lsp.enable {
    'qmlls',
    'lua_ls',
    'tinymist',
    'emmet_ls',
}
