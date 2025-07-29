vim.pack.add {
    -- neovim theme
    'https://github.com/rebelot/kanagawa.nvim',
    -- inner lsp for cli
    'https://github.com/nvimtools/none-ls.nvim',
    'https://github.com/nvim-lua/plenary.nvim',

    -- treesitter
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',

    'https://github.com/kylechui/nvim-surround',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/norcalli/nvim-colorizer.lua',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/tpope/vim-sleuth',
    'https://github.com/mason-org/mason.nvim',
}

require('mason').setup {}
require('colorizer').setup { '*' }
require('oil').setup {}
require('nvim-surround').setup {}

-- setup fzf-lua separately
require 'fzf'
