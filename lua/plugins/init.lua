vim.cmd "packadd packer.nvim"

local plugins = {
  { "wbthomason/packer.nvim" },
  { "kevinhwang91/promise-async" },
  { "nvim-lua/plenary.nvim", module = "plenary" },
  { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  },

  -- theme
  { "rebelot/kanagawa.nvim",
    config = function ()
      require "plugins.cfgs.theme"
    end
  },

  -- UI
  { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
  { "elihunter173/dirbuf.nvim",
    config = function ()
      require "plugins.cfgs.dirbuf"
    end
  },
  { "stevearc/dressing.nvim",
    config = function ()
      require "plugins.cfgs.dressing"
    end
  },
  { "folke/todo-comments.nvim",
    config = function ()
      require "todo-comments".setup {}
    end
  },
  { "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require "plugins.cfgs.ib"
    end
  },
  { "noib3/nvim-cokeline",
    config = function ()
      require "plugins.cfgs.bufferline"
    end
  },
  { "nvim-lualine/lualine.nvim",
    config = function ()
      require "plugins.cfgs.statusline"
    end,
  },
  { "lewis6991/gitsigns.nvim",
    config = function ()
      require "plugins.cfgs.gitsigns"
    end
  },
  { "akinsho/toggleterm.nvim",
    config = function ()
      require "plugins.cfgs.terminal"
    end
  },

  -- Additional moving functionality plugins
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "ggandor/leap.nvim",
    config = function ()
      require "plugins.cfgs.leap"
    end,
  },
  { "numToStr/Comment.nvim",
    config = function ()
      require "plugins.cfgs.comment"
    end,
  },
  { "max397574/better-escape.nvim",
    config = function ()
      require "plugins.cfgs.betterescape"
    end,
  },

  -- Telescope
  { "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-project.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function ()
      require "plugins.cfgs.telescope"
    end
  },

  -- Lsp & autocompletition stuff
  { "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      require "plugins.cfgs.cmp"
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "mfussenegger/nvim-dap",
    requires = {
      { "ravenxrz/DAPInstall.nvim",
      },
      { "rcarriga/nvim-dap-ui" },
    },
    config = function ()
      require "plugins.cfgs.dap"
    end
  },
  { "williamboman/nvim-lsp-installer" },
  { "neovim/nvim-lspconfig",
    after = "nvim-lsp-installer",
    config = function()
      require "plugins.cfgs.lspinstall"
      require "plugins.cfgs.lsp"
    end,
  },

  -- Misc
  { "frabjous/knap" },
}

require("core.packer").run(plugins)
