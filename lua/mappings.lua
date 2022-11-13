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
        ['<leader>e'] = ':e ' .. vim.fn.expand('%'),
        ['<C-c>'] = '<cmd>%y+<cr>',
        ['<Tab>'] = '<cmd>bn<cr>',
        ['<S-Tab>'] = '<cmd>bp<cr>',
        ['"f'] = require'leap-ast'.leap,
    },
    x = {
        ['"f'] = require'leap-ast'.leap,
    },
    o = {
        ['"f'] = require'leap-ast'.leap,
    }
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
        ['<leader>bf'] = function()
            vim.lsp.buf.format { async = true }
        end,
    },
}

M.telescope = {
    n = {
        ['<leader>f'] = '<cmd>lua require"telescope.builtin".find_files()<cr>',
        ['<leader>td'] = '<cmd>lua require"telescope.builtin".diagnostics()<cr>',
        ['<leader>tt'] = '<cmd>lua require"telescope.builtin".treesitter()<cr>',
        ['<leader>tg'] = '<cmd>lua require"telescope.builtin".live_grep()<cr>',
        ['<leader>tb'] = '<cmd>lua require"telescope.builtin".buffers()<cr>',
        ['<leader>xl'] = '<cmd>lua require"telescope".extensions.worktrees.list_worktrees()<cr>'
    },
}

M.worktrees = {
    n = {
        ['<leader>xn'] = '<cmd>lua require"worktrees".new_worktree()<cr>',
        ['<leader>xe'] = '<cmd>lua require"worktrees".new_worktree(true)<cr>',
    }
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

return M
