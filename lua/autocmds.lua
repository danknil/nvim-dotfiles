local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local utils = require 'utils'

local disable_ft = { 'netrw', 'zsh', 'oil' }

autocmd('PackChanged', {
    callback = function(ev)
        -- FIXME: should build blink.cmp nightly???
    end,
})

autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank { higroup = 'Visual', timeout = 300 }
    end,
})

autocmd('LspAttach', {
    group = augroup('lspattach', { clear = true, }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client ~= nil and client.name == "tinymist" then
            vim.api.nvim_buf_create_user_command(ev.buf, "TinymistPin", function ()
                client:exec_cmd({
                    title = "pin",
                    command = "tinymist.pinMain",
                    arguments = { vim.api.nvim_buf_get_name(0) },
                }, { bufnr = ev.buf })
            end, {})

            vim.api.nvim_buf_create_user_command(ev.buf, "TinymistUnpin", function ()
                client:exec_cmd({
                    title = "unpin",
                    command = "tinymist.pinMain",
                    arguments = { vim.v.null },
                }, { bufnr = ev.buf })
            end, {})
        end
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
            },
        }, { noremap = true, silent = true, buffer = ev.buf })
    end,
})

-- auto mkdir
-- TODO: fix creating dir in non file buffers
-- augroup('mkdir', { clear = true })
-- autocmd('BufWritePre', {
--     group = 'mkdir',
--     pattern = '*',
--     callback = function()
--         local file_path = vim.fn.expand '%:p'
--         local dir_path = vim.fn.fnamemodify(file_path, ':h')
--
--         if not vim.loop.fs_stat(dir_path) then
--             vim.fn.mkdir(dir_path, 'p')
--         end
--     end,
-- })
