return {
    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = {
            'rafamadriz/friendly-snippets',
            { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        },
        -- version = 'v1.*',
        build = 'cargo build --release',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'super-tab' },
            completion = {
                keyword = { range = 'prefix' },
                trigger = {
                    show_in_snippet = false,
                    show_on_keyword = true,
                    show_on_trigger_character = true,
                },
                list = {
                    max_items = 50,
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },
                accept = {
                    auto_brackets = {
                        enabled = false,
                    },
                },
                menu = {
                    scrolloff = 4,
                    scrollbar = false,
                },
                ghost_text = {
                    enabled = true,
                },
            },
            fuzzy = { implementation = 'prefer_rust_with_warning' },
            signature = {
                enabled = true,
                window = { show_documentation = false },
            },
            sources = {
                default = { 'lsp', 'buffer', 'snippets', 'path' },
                per_filetype = {
                    lua = {
                        inherit_defaults = true,
                        'lazydev',
                    },
                },
                providers = {
                    lsp = { score_offset = 30 },
                    buffer = { score_offset = -10 },
                    snippets = { score_offset = 40 },
                    path = { score_offset = -2 },
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        fallbacks = { 'lsp' },
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },

            -- keymap = { preset = 'super-tab' },
            -- snippets.preset = 'luasnip',
            -- sources = {
            --     default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
            --     providers = {
            --         lsp = {
            --             name = 'LSP',
            --             module = 'blink.cmp.sources.lsp',
            --             max_items = 5, -- maximum number of items to return
            --             min_keyword_length = 2, -- minimum number of characters to trigger the provider
            --             fallbacks = { 'buffer' },
            --         },
            --         lazydev = {
            --             name = 'LazyDev',
            --             fallbacks = { 'lsp' },
            --             module = 'lazydev.integrations.blink',
            --         },
            --         path = {
            --             name = 'Path',
            --             module = 'blink.cmp.sources.path',
            --             score_offset = 4,
            --             max_items = 2, -- maximum number of items to return
            --             min_keyword_length = 4, -- minimum number of characters to trigger the provider
            --             opts = {
            --                 trailing_slash = false,
            --                 label_trailing_slash = true,
            --                 get_cwd = function(context)
            --                     return vim.fn.expand(('#%d:p:h'):format(context.bufnr))
            --                 end,
            --                 show_hidden_files_by_default = false,
            --             },
            --         },
            --         snippets = {
            --             name = 'Snippets',
            --             module = 'blink.cmp.sources.snippets',
            --             score_offset = 3,
            --             opts = {
            --                 friendly_snippets = true,
            --                 search_paths = { vim.fn.stdpath 'config' .. '/snippets' },
            --                 global_snippets = { 'all' },
            --                 extended_filetypes = {},
            --                 ignored_filetypes = {},
            --             },
            --         },
            --         buffer = {
            --             name = 'Buffer',
            --             score_offset = -4,
            --             module = 'blink.cmp.sources.buffer',
            --         },
            --     },
            -- },
            --
            -- signature = { enabled = true },
        },
        -- allows extending the enabled_providers array elsewhere in your config
        -- without having to redefine it
        opts_extend = { 'sources.completion.enabled_providers' },
    },
}
