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
        -- ['<Tab>'] = { '<cmd>bn<cr>', { silent = true } },
        -- ['<S-Tab>'] = { '<cmd>bp<cr>', { silent = true } },
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
        ['<leader>bf'] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            {},
        },
    },
}

M.grapple = {
    n = {
        ['<leader>a'] = { '<cmd>Grapple toggle<cr>', {} },
        ['<leader>h'] = { '<cmd>Grapple toggle_tags<cr>', {} },
        ['<F1>'] = { '<cmd>Grapple select index=1<cr>', {} },
        ['<F2>'] = { '<cmd>Grapple select index=2<cr>', {} },
        ['<F3>'] = { '<cmd>Grapple select index=3<cr>', {} },
        ['<F4>'] = { '<cmd>Grapple select index=4<cr>', {} },
        ['<Tab>'] = { '<cmd>Grapple cycle_tags next<cr>', {} },
        ['<S-Tab>'] = { '<cmd>Grapple cycle_tags prev<cr>', {} },
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

M.harpoon = {
    n = {
        ['<leader>a'] = {
            function()
                require('harpoon.mark').add_file()
            end,
            {},
        },
        ['<leader>h'] = {
            function()
                require('harpoon.ui').toggle_quick_menu()
            end,
            {},
        },
        ['<F1>'] = {
            function()
                require('harpoon.ui').nav_file(1)
            end,
            {},
        },
        ['<F2>'] = {
            function()
                require('harpoon.ui').nav_file(2)
            end,
            {},
        },
        ['<F3>'] = {
            function()
                require('harpoon.ui').nav_file(3)
            end,
            {},
        },
        ['<F4>'] = {
            function()
                require('harpoon.ui').nav_file(4)
            end,
            {},
        },
    },
}

M.quickfix = {
    n = {
        ['<leader>q'] = {
            '<cmd>copen<cr>',
            {},
        },
    },
}

M.coq = {
    i = {
        ['<Esc>'] = {
            function()
                return utils.pumvisible() and '<C-e><Esc>' or '<Esc>'
            end,
            {},
        },
        ['<C-c>'] = {
            function()
                return utils.pumvisible() and '<C-e><C-c>' or '<C-c>'
            end,
            {},
        },
        ['<BS>'] = {
            function()
                return utils.pumvisible() and '<C-e><BS>' or '<BS>'
            end,
            {},
        },
        ['<CR>'] = {
            function()
                return utils.pumvisible() and (utils.get_complete_selected() == -1 and '<C-e><CR>' or '<C-y>') or '<CR>'
            end,
            {},
        },
        ['<S-Tab>'] = {
            function()
                return utils.pumvisible() and '<C-p>' or '<S-Tab>'
            end,
            {},
        },
        ['<Tab>'] = {
            function()
                if utils.pumvisible() then
                    return utils.get_complete_selected() == -1 and '<C-n><C-y>' or '<C-n>'
                else
                    return '<Tab>'
                end
            end,
            {},
        },
    },
}

M.minipick = {
    n = {
        ['<leader>f'] = {
            function()
                MiniPick.builtin.files { tool = 'rg' }
            end,
            {},
        },
        ['<leader>ld'] = {
            function()
                MiniPick.builtin.diagnostic()
            end,
            {},
        },
        ['<leader>ls'] = {
            function()
                MiniPick.builtin.lsp()
            end,
            {},
        },
        ['<leader>ts'] = {
            function()
                MiniPick.builtin.treesitter()
            end,
            {},
        },
        ['<leader>g'] = {
            function()
                MiniPick.builtin.grep_live { tool = 'rg' }
            end,
            {},
        },
        ['<leader>b'] = {
            function()
                MiniPick.builtin.buffers { include_current = false }
            end,
            {},
        },
    },
}

M.telescope = {
    n = {
        ['<leader>f'] = { '<cmd>Telescope find_files<cr>', {} },
        ['<leader>td'] = { '<cmd>Telescope diagnostics<cr>', {} },
        ['<leader>tt'] = { '<cmd>Telescope treesitter<cr>', {} },
        ['<leader>tg'] = { '<cmd>lua require"telescope.builtin".live_grep()<cr>', {} },
        ['<leader>tb'] = { '<cmd>lua require"telescope.builtin".buffers()<cr>', {} },
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
