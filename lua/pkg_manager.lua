local path = vim.fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
local pkgs = {
    'savq/paq-nvim',

    -- Core
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
    'rebelot/kanagawa.nvim',
    'lewis6991/impatient.nvim',

    -- snippets
    'L3MON4D3/LuaSnip',

    -- coq
    { 'ms-jpq/coq_nvim', branch = 'coq' },
    { 'ms-jpq/coq.thirdparty', branch = '3p' },

    -- Moves
    'numToStr/Comment.nvim',
    'tpope/vim-repeat',
    'kylechui/nvim-surround',
    'ggandor/leap.nvim',
    'ggandor/leap-ast.nvim',

    -- LSP
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'tamago324/nlsp-settings.nvim',
    'folke/trouble.nvim',
    { 'mfussenegger/nvim-jdtls', opt = true },
    { 'folke/lua-dev.nvim', opt = true },

    -- DAP
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',

    -- Telescope
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
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

    -- Misc
    'jghauser/mkdir.nvim',
    'luukvbaal/stabilize.nvim',
    'Juksuu/worktrees.nvim',
    'gpanders/editorconfig.nvim',
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

local function bootstrap()
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
