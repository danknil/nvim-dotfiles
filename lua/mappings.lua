local hydra = require 'hydra'
local utils = require 'utils'
local luasnip = require 'luasnip'
local cmd = vim.cmd
local M = {}

function M:load_mappings(mappings, opts)
    for mode, mappings_list in pairs(self[mappings]) do
        for mapping, func in pairs(mappings_list) do
            vim.keymap.set(mode, mapping, func, opts)
        end
    end
end

M.general = {
    i = {
        ['<C-h>'] = '<Left>',
        ['<C-j>'] = '<Down>',
        ['<C-k>'] = '<Up>',
        ['<C-l>'] = '<Right>',
    },
    n = {
        ['<space>'] = '<cmd>noh<cr>',
        ['<leader>e'] = '<cmd>Vex<cr>',
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
        ['<leader>D'] = vim.lsp.buf.type_definition,
        ['<leader>rn'] = vim.lsp.buf.rename,
        ['<leader>ca'] = vim.lsp.buf.code_action,
        ['gr'] = vim.lsp.buf.references,
        ['<leader>bf'] = '<cmd>Format<cr>',
    },
}

M.telescope = {
    n = {
        ['<leader>f'] = '<cmd>lua require"telescope.builtin".find_files()<cr>',
        ['<leader>td'] = '<cmd>lua require"telescope.builtin".diagnostics()<cr>',
        ['<leader>tt'] = '<cmd>lua require"telescope.builtin".treesitter()<cr>',
        ['<leader>tp'] = '<cmd>lua require"telescope".extensions.project.project()<cr>',
        ['<leader>tb'] = '<cmd>lua require"telescope.builtin".buffers()<cr>',
    },
}

M.luasnip = {
    i = {
        -- luasnip
        ['<C-n>'] = '<Plug>luasnip-next-choice',
        ['<C-p>'] = '<Plug>luasnip-prev-choice',
    },
    s = {
        ['<C-n>'] = '<Plug>luasnip-next-choice',
        ['<C-p>'] = '<Plug>luasnip-prev-choice',
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
            if utils.pumvisible() then
                return '<C-p>'
            else
                if luasnip.jumpable(-1) then
                    return '<C-e><Plug>luasnip-jump-prev'
                else
                    return '<S-Tab>'
                end
            end
        end,
        ['<Tab>'] = function()
            if luasnip.expandable() then
                return '<C-e><Plug>luasnip-expand'
            end
            if utils.pumvisible() then
                return utils.get_complete_selected() == -1 and '<C-n><C-y>' or '<C-n>'
            else 
                if luasnip.expand_or_jumpable() then
                    return '<C-e><Plug>luasnip-expand-or-jump'
                else
                    return '<Tab>'
                end
            end
        end,
    },
}

hydra {
    name = 'Window manager',
    hint = 'statusline',
    mode = 'n',
    body = '<C-w>',
    config = {
        color = 'red',
    },
    heads = {
        -- move between windows
        { 'h', '<C-w>h' },
        { 'j', '<C-w>j' },
        { 'k', '<C-w>k' },
        { 'l', '<C-w>l' },

        -- resizing window
        { 'H', '<C-w>3<' },
        { 'L', '<C-w>3>' },
        { 'K', '<C-w>2+' },
        { 'J', '<C-w>2-' },

        -- equalize window sizes
        { 'e', '<C-w>=' },

        -- close active window
        { 'q', ':q<cr>' },

        -- exit this Hydra
        { 'Q', nil, { exit = true, nowait = true } },
        { ';', nil, { exit = true, nowait = true } },
        { '<Esc>', nil, { exit = true, nowait = true } },
    },
}

return M
