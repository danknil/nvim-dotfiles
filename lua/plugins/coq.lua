return {
    {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        lazy = false,
        config = function() 
            vim.g.coq_settings = {
                auto_start = 'shut-up',
                xdg = true,
                keymap = {
                    recommended = false,
                    jump_to_mark = '<C-n>',
                },
                clients = {
                    ['tmux.enabled'] = false,
                    snippets = {
                        short_name = 'SN',
                        weight_adjust = 2.5,
                    };
                    lsp = {
                        short_name = 'LSP',
                        weight_adjust = 2.3,
                    },
                    tags = {
                        short_name = 'TAG',
                        weight_adjust = 0.8,
                    },
                    paths = {
                        short_name = 'PATH',
                        weight_adjust = 1.2,
                    },
                    tree_sitter = {
                        short_name = 'TS',
                        weight_adjust = 1.9,
                    },
                    buffers = {
                        short_name = 'BUF',
                        weight_adjust = 0.5,
                    },
                },
                match = {
                    exact_matches = 2,
                    look_ahead = 4,
                },
                weights = {
                    prefix_matches = 1.6,
                    recency = 1.5,
                },
                -- completion = {
                --     skip_after = { '{', '}', '[', ']' },
                -- },
                display = {
                    ['ghost_text.context'] = { ' ', ' ' },
                    pum = {
                        y_max_len = 5,
                        y_ratio = 0.1,
                        x_max_len = 40,
                        kind_context = { " [ ",  " ] " },
                        source_context = { " ", " " },
                    },
                    preview = {
                        border = 'single',
                        positions = {
                            north = 2,
                            south = nil,
                            west = nil,
                            east = 1,
                        },
                    },
                    ['icons.mode'] = 'none',
                },
            }
            require('mappings'):load_mappings('coq', { noremap = true, silent = true, expr = true })
        end,
        dependencies = {
            { "ms-jpq/coq.artifacts", branch = "artifacts" },
            { 'ms-jpq/coq.thirdparty', branch = "3p" }
        },
    }
}
