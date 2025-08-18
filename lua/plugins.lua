local cmd = vim.api.nvim_create_user_command

local plugins = {
    -- lib req
    'https://github.com/nvim-lua/plenary.nvim',
    -- neovim theme
    'https://github.com/rebelot/kanagawa.nvim',
    -- inner lsp setup
    'https://github.com/stevearc/conform.nvim',
    { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range '1.*' },

    -- treesitter
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',

    'https://github.com/chrisgrieser/nvim-origami',
    'https://github.com/kylechui/nvim-surround',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/tpope/vim-sleuth',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/chomosuke/typst-preview.nvim',
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
require('oil').setup {}
require('nvim-surround').setup {}
require('nvim-treesitter.configs').setup {
    highlight = { enable = true },
}

-- longer setups
require 'fzf'
require 'cmp'
