local pkgs = {
  "savq/paq-nvim";

  -- Core
  "nvim-lua/plenary.nvim";
  "kyazdani42/nvim-web-devicons";
  "nvim-treesitter/nvim-treesitter";
  "rebelot/kanagawa.nvim";

  -- Moves
  "tpope/vim-repeat";
  "max397574/better-escape.nvim";
  "kylechui/nvim-surround";
  "ggandor/leap.nvim";
  "numToStr/Comment.nvim";
  "anuvyklack/hydra.nvim";
  "ziontee113/syntax-tree-surfer";
  "RRethy/nvim-treesitter-textsubjects";

  -- LSP
  "williamboman/nvim-lsp-installer";
  "neovim/nvim-lspconfig";
  "jose-elias-alvarez/null-ls.nvim";
  "onsails/lspkind.nvim";

  -- DAP
  "mfussenegger/nvim-dap";
  "ravenxrz/DAPInstall.nvim";
  "rcarriga/nvim-dap-ui";

  -- cmp
  "hrsh7th/nvim-cmp";
  "L3MON4D3/LuaSnip";
  "saadparwaiz1/cmp_luasnip";
  "hrsh7th/cmp-nvim-lua";
  "hrsh7th/cmp-nvim-lsp";
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-path";

  -- Telescope
  "nvim-telescope/telescope.nvim";
  "nvim-telescope/telescope-project.nvim";
  "benfowler/telescope-luasnip.nvim";
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" };

  -- UI
  "matbme/JABS.nvim";
  "rebelot/heirline.nvim";
  "stevearc/dressing.nvim";
  "lukas-reineke/indent-blankline.nvim";
  "lewis6991/gitsigns.nvim";
  "folke/todo-comments.nvim";
  "xiyaowong/nvim-cursorword";
  "SmiteshP/nvim-navic";
  "anuvyklack/pretty-fold.nvim";

  -- Misc
  "frabjous/knap";
  "rmagatti/auto-session";
  "jghauser/mkdir.nvim";
}
local function clone_paq()
  local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system {
      'git',
      'clone',
      '--depth=1',
      'https://github.com/savq/paq-nvim.git',
      path
    }
  end
end

function bootstrap()
  clone_paq()
  -- Load Paq
  vim.cmd('packadd paq-nvim')
  local paq = require('paq')
  -- Read and install packages
  paq(pkgs)
  paq.install()
end

vim.api.nvim_create_user_command("PaqSetup", bootstrap, { nargs = 0 })
return { bootstrap = bootstrap }