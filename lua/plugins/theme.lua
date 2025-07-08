return {
    'rebelot/kanagawa.nvim',
    config = function()
        -- Default options:
        require('kanagawa').setup {
            compile = true,
            undercurl = true,
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            terminalColors = true,
            theme = 'dragon',
            background = {
                dark = 'dragon',
                light = 'dragon',
            },
        }

        -- setup must be called before loading
        vim.cmd 'colorscheme kanagawa'
    end,
}
