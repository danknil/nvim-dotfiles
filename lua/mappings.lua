local utils = require 'utils'
local luasnip = require 'luasnip'
local M = {}

function M:load_mappings(mappings, opts)
    for mode, mappings_list in pairs(self[mappings]) do
        for mapping, func in pairs(mappings_list) do
            vim.keymap.set(mode, mapping, func, opts)
        end
    end
end

M.general = {
    n = {
        ['<space>'] = '<cmd>noh<cr>',
        ['<leader>e'] = ':e<space>' .. vim.fn.expand '%',
        ['<C-c>'] = '<cmd>%y+<cr>',
        ['<Tab>'] = '<cmd>bn<cr>',
        ['<S-Tab>'] = '<cmd>bp<cr>',
    },
}

M.lsp = {
    n = {
        ['gD'] = vim.lsp.buf.declaration,
        ['gd'] = vim.lsp.buf.definition,
        ['K'] = vim.lsp.buf.hover,
        ['gi'] = vim.lsp.buf.implementation,
        ['<C-k>'] = vim.lsp.buf.signature_help,
        ['<leader>rn'] = vim.lsp.buf.rename,
        ['<leader>ca'] = vim.lsp.buf.code_action,
        ['<leader>bf'] = function()
            vim.lsp.buf.format { async = true }
        end,
    },
}

M.leap_ast = {
    n = {
        ['"f'] = require('leap-ast').leap,
    },
    x = {
        ['"f'] = require('leap-ast').leap,
    },
    o = {
        ['"f'] = require('leap-ast').leap,
    },
}

M.dial = {}

M.telescope = {
    n = {
        ['<leader>f'] = '<cmd>Telescope fd<cr>',
        ['<leader>td'] = '<cmd>Telescope diagnostics<cr>',
        ['<leader>tt'] = '<cmd>Telescope treesitter<cr>',
        ['<leader>tg'] = '<cmd>lua require"telescope.builtin".live_grep()<cr>',
        ['<leader>tb'] = '<cmd>lua require"telescope.builtin".buffers()<cr>',
    },
}

M.luasnip = {
    i = {
        ['<C-n>'] = '<Plug>(luasnip-next-choice)',
        ['<C-p>'] = '<Plug>(luasnip-prev-choice)',
    },
    s = {
        ['<C-n>'] = '<Plug>(luasnip-next-choice)',
        ['<C-p>'] = '<Plug>(luasnip-prev-choice)',
    },
}

M.completion = {
    i = {
        -- autocomplete
        ['<Esc>'] = function()
            return utils.pumvisible() and '<C-e><Esc>' or '<Esc>'
        end,
        ['<C-c>'] = function()
            return utils.pumvisible() and '<C-e><C-c>' or '<C-c>'
        end,
        ['<BS>'] = function()
            return utils.pumvisible() and '<C-e><BS>' or '<BS>'
        end,
        ['<CR>'] = function()
            return utils.pumvisible() and (utils.get_complete_selected() == -1 and '<C-e><CR>' or '<C-y>') or '<CR>'
        end,
        ['<S-Tab>'] = function()
            if luasnip.jumpable(-1) then
                return '<C-e><cmd>lua require"luasnip".jump(-1)<cr>'
            else
                if utils.pumvisible() then
                    return '<C-p>'
                else
                    return '<S-Tab>'
                end
            end
        end,
        ['<Tab>'] = function()
            if luasnip.expand_or_jumpable() then
                return '<C-e><cmd>lua require"luasnip".expand_or_jump()<cr>'
            else
                if utils.pumvisible() then
                    return utils.get_complete_selected() == -1 and '<C-n><C-y>' or '<C-n>'
                else
                    return '<Tab>'
                end
            end
        end,
    },
}

M.trouble = {
    n = {
        ['gr'] = '<cmd>Trouble lsp_references<cr>',
        ['<leader>d'] = '<cmd>Trouble workspace_diagnostics<cr>',
    },
}

M.todo = {
    n = {
        ['<leader>D'] = '<cmd>TodoTelescope<cr>',
    },
}

return M
