local telescope = require "telescope"
telescope.setup {
  defaults = {
    mappings = {
      i = {
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

telescope.load_extension "fzf"
telescope.load_extension "dap"
telescope.load_extension "luasnip"
telescope.load_extension "project"
telescope.load_extension "file_browser"
