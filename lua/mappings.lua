local utils = require 'utils'
local M = {}

local disable_ft = { 'TelescopePrompt', 'netrw', 'zsh' }

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
        ['<leader>bf'] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            {},
        },
    },
}

M.leap_ast = {
    n = {
        ['"f'] = { require('leap-ast').leap, {} },
    },
    x = {
        ['"f'] = { require('leap-ast').leap, {} },
    },
    o = {
        ['"f'] = { require('leap-ast').leap, {} },
    },
}

M.dial = {}

M.telescope = {
    n = {
        ['<leader>f'] = { '<cmd>Telescope fd<cr>', {} },
        ['<leader>td'] = { '<cmd>Telescope diagnostics<cr>', {} },
        ['<leader>tt'] = { '<cmd>Telescope treesitter<cr>', {} },
        ['<leader>tg'] = { '<cmd>lua require"telescope.builtin".live_grep()<cr>', {} },
        ['<leader>tb'] = { '<cmd>lua require"telescope.builtin".buffers()<cr>', {} },
    },
}

M.luasnip = {
    i = {
        ['<C-n>'] = { '<Plug>(luasnip-next-choice)', {} },
        ['<C-p>'] = { '<Plug>(luasnip-prev-choice)', {} },
    },
    s = {
        ['<C-n>'] = { '<Plug>(luasnip-next-choice)', {} },
        ['<C-p>'] = { '<Plug>(luasnip-prev-choice)', {} },
    },
}

M.trouble = {
    n = {
        ['gr'] = { '<cmd>Trouble lsp_references<cr>', {} },
        ['<leader>d'] = { '<cmd>Trouble workspace_diagnostics<cr>', {} },
    },
}

M.todo = {
    n = {
        ['<leader>D'] = { '<cmd>TodoTelescope<cr>', {} },
    },
}

return M
