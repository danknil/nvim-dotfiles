return {
    {
        'stevearc/conform.nvim',
        config = function(plugin, opts)
            require('conform').setup(opts)

            vim.api.nvim_create_user_command('FormatToggle', function(args)
                local enabled = 'Disabled'
                if vim.b.disable_autoformat or vim.g.disable_autoformat then
                    enabled = 'Enabled'
                end

                if args.bang then
                    vim.b.disable_autoformat = not vim.b.disable_autoformat
                    vim.print(enabled .. ' autoformat-on-save for buffer')
                else
                    vim.g.disable_autoformat = not vim.g.disable_autoformat
                    vim.print(enabled .. ' autoformat-on-save globally')
                end
            end, {
                desc = 'Toggle autoformat-on-save',
                bang = true,
            })

            require('mappings'):load_mappings('conform', { noremap = true })
        end,
        opts = {
            format_after_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return { timeout_ms = 500, lsp_format = 'fallback' }
            end,
            formatters_by_ft = {
                c = { 'clang-format' },
                lua = { 'stylua' },
                rust = { 'alejandra' },
                go = { 'goimports', 'golines', 'revive' },

                javascript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescript = { 'prettier' },
                typescriptreact = { 'prettier' },
                vue = { 'prettier' },
                css = { 'prettier' },
                scss = { 'prettier' },
                less = { 'prettier' },
                html = { 'prettier' },
                json = { 'prettier' },
                jsonc = { 'prettier' },
                yaml = { 'prettier' },
                markdown = { 'prettier' },
                ['markdown.mdx'] = { 'prettier' },
                graphql = { 'prettier' },
                handlebars = { 'prettier' },
            },
        },
    },
}
