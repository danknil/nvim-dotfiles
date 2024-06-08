return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-telescope/telescope-project.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local telescope = require 'telescope'

        telescope.setup {
            pickers = {
                find_files = {
                    border = false,
                    layout_strategy = 'bottom_pane',
                    layout_config = {
                        height = 0.4,
                        prompt_position = 'bottom',
                        preview_cutoff = 9999,
                    },
                },
                live_grep = {
                    border = false,
                    layout_strategy = 'bottom_pane',
                    layout_config = {
                        height = 0.4,
                        prompt_position = 'bottom',
                        preview_cutoff = 20,
                    },
                },
                diagnostics = {
                    border = false,
                    layout_strategy = 'bottom_pane',
                    layout_config = {
                        height = 0.4,
                        prompt_position = 'bottom',
                        preview_cutoff = 20,
                    },
                },
                -- ['ui-select'] = {
                --     border = false,
                --     layout_strategy = 'vertical',
                --     layout_config = {
                --         width = 0.5,
                --         height = 0.3,
                --         preview_height = 0,
                --         prompt_position = 'top',
                --     },
                --     mappings = {
                --         i = {},
                --     },
                -- },
            },
            extensions = {
                ['ui-select'] = {}
            },
        }

        telescope.load_extension 'project'
        telescope.load_extension 'ui-select'

        require('mappings'):load_mappings('telescope', { silent = true, noremap = true })
    end,
}
