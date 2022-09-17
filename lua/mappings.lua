local hydra = require 'hydra'
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
        ['<C-n>'] = '<Plug>luasnip-next-choice',
        ['<C-p>'] = '<Plug>luasnip-prev-choice',
    },
    s = {
        ['<C-n>'] = '<Plug>luasnip-next-choice',
        ['<C-p>'] = '<Plug>luasnip-prev-choice',
    }
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
