local cmd = vim.api.nvim_create_user_command

local plugins = {
    -- lib req
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/folke/snacks.nvim' },
    -- neovim theme
    { src = 'https://github.com/rose-pine/neovim.git' },
    -- inner lsp setup
    { src = 'https://github.com/stevearc/conform.nvim' },
    { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range 'v2.*' },
    { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range '1.*' },

    -- treesitter
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },

    { src = 'https://github.com/chrisgrieser/nvim-origami' },
    { src = 'https://github.com/kylechui/nvim-surround' },
    { src = 'https://github.com/mikavilpas/yazi.nvim' },
    { src = 'https://github.com/brenoprata10/nvim-highlight-colors' },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
    { src = 'https://github.com/tpope/vim-sleuth' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/chomosuke/typst-preview.nvim' },
}

cmd('PackSync', function()
    local to_delete = {}
    for _, plugin in ipairs(vim.pack.get()) do
        table.insert(to_delete, plugin.spec.name)
    end
    vim.pack.del(to_delete)
    vim.pack.add(plugins)
    vim.pack.update()
end, {
    nargs = 0,
    desc = 'Sync vim.pack managed list to current',
})

cmd('PackUpdate', function()
    vim.pack.update()
end, {
    nargs = 0,
    desc = 'Update vim.pack managed plugins',
})

vim.pack.add(plugins)

require('mason').setup {}
require('nvim-highlight-colors').setup { '*' }
require('nvim-surround').setup {}
require('snacks').setup {
    input = { enabled = true },
}

-- longer setups
require 'plugins.cmp'
require 'plugins.files'
require 'plugins.theme'
