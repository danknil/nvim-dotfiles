local utils = require 'utils'
local M = {}

local disable_ft = { 'TelescopePrompt', 'netrw', 'zsh', 'oil' }

function M:load_mappings(mappings, opts)
    for mode, mappings_list in pairs(self[mappings]) do
        for mapping, func in pairs(mappings_list) do
            vim.keymap.set(mode, mapping, func[1], vim.tbl_extend('keep', opts, func[2]))
        end
    end
end

M.general = {
    n = {
        ['<space>'] = { '<cmd>noh<cr>', { silent = true } },
        ['<leader>e'] = {
            function()
                -- TODO: rework to disable in certain situations
                local bufdir = utils.get_curr_bufdir()
                return ':e ' .. bufdir
            end,
            { expr = true },
        },

        ['<C-c>'] = { '<cmd>%y+<cr>', { silent = true } },
        ['<Tab>'] = { '<cmd>bn<cr>', { silent = true } },
        ['<S-Tab>'] = { '<cmd>bp<cr>', { silent = true } },
        ['<leader>bd'] = { '<cmd>bdelete', { silent = true } },
        ['<leader>y'] = { '"+y', { silent = true } },
        ['<leader>Y'] = { '"+Y', { silent = true } },
        ['<leader>p'] = { '"+p', { silent = true } },
        ['<leader>P'] = { '"+P', { silent = true } },
    },
}

M.lsp = {
    n = {
        ['gD'] = { vim.lsp.buf.declaration, {} },
        ['gd'] = { vim.lsp.buf.definition, {} },
        ['K'] = { vim.lsp.buf.hover, {} },
        ['gi'] = { vim.lsp.buf.implementation, {} },
        ['<C-k>'] = { vim.lsp.buf.signature_help, {} },
        ['<leader>rn'] = { vim.lsp.buf.rename, {} },
        ['<leader>ca'] = { vim.lsp.buf.code_action, {} },
        ['<leader>lq'] = { vim.diagnostic.setqflist, {} },
        ['<leader>bf'] = { utils.lsp_formatting, {} },
    },
}

M.dropbar = {
    n = {
        ['<leader>s'] = {
            function()
                require('dropbar.api').pick()
            end,
            {},
        },
    },
}

M.quickfix = {
    n = {
        ['<leader>q'] = {
            function()
                require('quicker').toggle()
            end,
            {},
        },
        ['<leader>l'] = {
            function()
                require('quicker').toggle { loclist = true }
            end,
            {},
        },
    },
}

M.picker = {
    n = {
        ['<leader>f'] = {
            function()
                Snacks.picker.files()
            end,
            {},
        },
        ['<leader>ts'] = {
            function()
                Snacks.picker.treesitter()
            end,
            {},
        },
        ['<leader>/'] = {
            function()
                Snacks.picker.grep()
            end,
            {},
        },
        ['<leader>tc'] = {
            function()
                Snacks.picker.todo_comments()
            end,
            {},
        },
        ['<leader>bf'] = {
            function()
                Snacks.picker.buffers()
            end,
            {},
        },
    },
}

return M
