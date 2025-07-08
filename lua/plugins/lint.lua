return {
    {
        'mfussenegger/nvim-lint',
        config = function()
            require('lint').linters_by_ft = {
                markdown = { 'vale', 'prettierd' },
                sh = { 'shellcheck' },
                php = { 'php' },
            }

            vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
                callback = function()
                    require('lint').try_lint()
                end,
            })
        end,
    },
}
