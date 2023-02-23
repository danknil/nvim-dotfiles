return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-telescope/telescope-project.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-lua/plenary.nvim',
        'dimaportenko/telescope-simulators.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local telescope = require 'telescope'

        telescope.setup {
            defaults = {
                borderchars = { '█', '█', '█', '█', '█', '█', '█', '█' },
                border = true,
                layout_strategy = 'vertical',
                layout_config = {
                    width = 0.5,
                    height = 0.3,
                    preview_height = 0,
                    prompt_position = 'top',
                },
                mappings = {
                    i = {},
                },
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
                ['ui-select'] = {},
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
                },
            },
        }

        telescope.load_extension 'fzf'
        telescope.load_extension 'project'
        telescope.load_extension 'ui-select'
        require('simulators').setup {
            android_emulator = true,
            apple_simulator = false,
        }

        require('mappings'):load_mappings('telescope', { silent = true, noremap = true })
    end,
}
