local path = vim.fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
local pkgs = {
    'savq/paq-nvim',

    -- Core
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
    'nathom/filetype.nvim',
    'rebelot/kanagawa.nvim',
    'lewis6991/impatient.nvim',

    -- Moves
    'tpope/vim-repeat',
    'max397574/better-escape.nvim',
    'kylechui/nvim-surround',
    'ggandor/leap.nvim',
    'numToStr/Comment.nvim',
    'anuvyklack/hydra.nvim',
    'RRethy/nvim-treesitter-textsubjects',

    -- LSP
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-lint',
    'mhartington/formatter.nvim',
    'tamago324/nlsp-settings.nvim',
    { 'folke/lua-dev.nvim', opt = true },

    -- DAP
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',

    -- snippets
    'L3MON4D3/LuaSnip',

    -- coq
    { 'ms-jpq/coq_nvim', branch = 'coq' },
    { 'ms-jpq/coq.thirdparty', branch = '3p' },
    -- 'mendes-davi/coq_luasnip',

    -- -- cmp
    -- 'hrsh7th/nvim-cmp',
    -- 'saadparwaiz1/cmp_luasnip',
    -- 'hrsh7th/cmp-nvim-lsp',
    -- 'hrsh7th/cmp-buffer',
    -- 'hrsh7th/cmp-path',

    -- Telescope
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-project.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

    -- Mason nvim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- UI
    'nvim-lualine/lualine.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'lewis6991/gitsigns.nvim',
    'folke/todo-comments.nvim',
    'stevearc/dressing.nvim',
    'anuvyklack/pretty-fold.nvim',

    -- Misc
    'jghauser/mkdir.nvim',
    'luukvbaal/stabilize.nvim',
}

local function clone_paq()
    print 'cloning paq...'
    vim.fn.system {
        'git',
        'clone',
        '--depth=1',
        'https://github.com/savq/paq-nvim.git',
        path,
    }
end

function bootstrap()
    -- Load Paq
    vim.cmd [[ packadd paq-nvim ]]
    local paq = require 'paq'
    -- Read and install packages
    paq(pkgs)
    paq.install()
end

---@diagnostic disable-next-line: missing-parameter
if vim.fn.empty(vim.fn.glob(path)) > 0 then
    clone_paq()
end
vim.api.nvim_create_user_command('PaqSetup', bootstrap, { nargs = 0 })
return { bootstrap = bootstrap }
