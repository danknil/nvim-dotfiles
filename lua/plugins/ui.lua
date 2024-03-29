return {
    {
        'folke/todo-comments.nvim',
        config = function()
            require('todo-comments').setup {}
            require('mappings'):load_mappings('todo', { noremap = true, silent = true })
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {
                show_current_context = true,
                show_current_context_start = false,
                show_current_context_start_on_current_line = false,
                char_list = { '│', '¦', '┆', '┊' },
            }
        end,
    },
    {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {}
            require('mappings'):load_mappings('trouble', { noremap = true, silent = true })
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {}
        end,
    },
    {
        'luukvbaal/stabilize.nvim',
        config = function ()
            require'stabilize'.setup()
        end,
    },
    {
        'folke/noice.nvim',
        config = function()
            require('noice').setup {
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                        ['vim.lsp.util.stylize_markdown'] = true,
                        ['cmp.entry.get_documentation'] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = true, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            }
        end,
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
    },
}
