require('pretty-fold').setup {
    keep_indentation = false,
    matchup_patterns = {
        --lua
        { '^%s*do$', 'end' }, -- `do ... end` blocks
        { '^%s*if', 'end' },
        { '^%s*for', 'end' },
        { 'function%s*%(', 'end' }, -- 'function(' or 'function ('

        -- --c
        -- { '^*\n*(*)\n{', '}' }, -- function
        -- { '^struct*(*)\n{', '}' }, -- function with struct
        -- { '^*struct%s{', '}*' }, -- struct

        --general
        { '{', '}' },
        { '%(', ')' }, -- % to escape lua pattern char
        { '%[', ']' }, -- % to escape lua pattern char
    },
    fill_char = '━',
    sections = {
        left = {
            '━ ',
            function()
                return string.rep('*', vim.v.foldlevel)
            end,
            ' ━┫',
            'content',
            '┣',
        },
        right = {
            '┫ ',
            'number_of_folded_lines',
            ' ┣━━',
        },
    },
}
