return {
    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = {
            'rafamadriz/friendly-snippets',
        },

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
        },
        -- allows extending the enabled_providers array elsewhere in your config
        -- without having to redefine it
        opts_extend = { 'sources.completion.enabled_providers' },
    },
}
