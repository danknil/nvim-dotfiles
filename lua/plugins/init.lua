vim.cmd "packadd packer.nvim"

local plugins = {
  { "nvim-lua/plenary.nvim", module = "plenary" },
  { "wbthomason/packer.nvim" },
  { "rcarriga/nvim-notify" },
  { "hood/popui.nvim",
    requires = { "RishabhRD/popfix" },
    config = function ()
      require "plugins.cfgs.popui"
    end
  },
  { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  },

  -- UI
  { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
  { "navarasu/onedark.nvim",
    config = function ()
      require "plugins.cfgs.theme"
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
    config = function ()
      require "plugins.cfgs.telescope"
    end
  },
  { "nvim-telescope/telescope-project.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },

  -- Lsp & autocompletition stuff
  { "hrsh7th/nvim-cmp",
    config = function()
      require "plugins.cfgs.cmp"
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "L3MON4D3/LuaSnip" },
  { "mfussenegger/nvim-dap" },
  { "ravenxrz/DAPInstall.nvim",
    as = "nvim-dap-installer",
  },
  { "rcarriga/nvim-dap-ui" },
  { "williamboman/nvim-lsp-installer" },
  { "neovim/nvim-lspconfig",
    after = "nvim-lsp-installer",
    config = function()
      require "plugins.cfgs.lspinstall"
      require "plugins.cfgs.lsp"
    end,
  },
}

require("core.packer").run(plugins)
