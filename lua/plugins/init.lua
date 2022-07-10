vim.cmd "packadd packer.nvim"

local mappings = require "core.mappings"

local plugins = {
  { "wbthomason/packer.nvim" },
  { "nvim-lua/plenary.nvim", module = "plenary" },
  { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function ()
      -- TODO: add cfg
    end
  },

  -- theme
  { "rebelot/kanagawa.nvim",
    config = function ()
      require "plugins.cfgs.theme"
    end
  },

  -- Misc
  { "frabjous/knap",
    config = function ()
      -- TODO: add cfg
    end
  },
  { "EthanJWright/vs-tasks.nvim",
    config = function ()
      -- TODO: add cfg
    end
  },
  { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
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
      mappings.load_mappings(mappings.bufferline, { silent = true })
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
  -- HACK: replace with nvim-surround when ready(https://github.com/kylechui/nvim-surround)
  { "tpope/vim-surround" },
  -- HACK: find lua replacement
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

  -- Telescope
  { "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-project.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function ()
      require "plugins.cfgs.telescope"
      mappings.load_mappings(mappings.telescope, { silent = true })
    end
  },

  -- Language support
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
  { "jose-elias-alvarez/null-ls.nvim",
    config = function ()
      -- TODO: add cfg
    end
  },
  { "mfussenegger/nvim-dap",
    requires = {
      { "ravenxrz/DAPInstall.nvim" },
      { "rcarriga/nvim-dap-ui" },
    },
    config = function ()
      -- TODO: add cfg
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
  { "jakewvincent/texmagic.nvim",
    config = function ()
      -- TODO: add cfg
    end
  },
}

require("core.packer").run(plugins)
