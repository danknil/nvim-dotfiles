local o = vim.opt_local
local utils = require 'utils'
local surround = require 'nvim-surround'

-- luasnip
local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local extras = require 'luasnip.extras'
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require('luasnip.extras.postfix').postfix

o.expandtab = true
o.shiftwidth = 2
o.smartindent = true

-- surround.buffer_setup {
--     surrounds = {
--         ['$'] = {
--             add = { '$', '$' },
--             find = '\$*\$',
--             delete = '^(.)().-(.)()$',
--         },
--     },
--     aliases = {},
-- }

ls.add_snippets('tex', {
    s('math', {
        c(1, {
            sn(nil, fmt('${}${}', { i(1), i(2) })),
            sn(
                nil,
                fmta(
                    [[
\begin{math}
  <>
\end{math}
<>
]],
                    { i(1), i(2) }
                )
            ),
        }),
    }),
    s(
        'block',
        fmta('\\begin{<>}\n<>\n\\end{<>}<>', {
            i(1),
            i(2),
            f(function(args, _, _)
                return args[1][1]
            end, { 1 }, {}),
            i(0),
        })
    ),
    s(
        'note',
        fmta(
            [[
\documentclass[17pt]{extarticle}

\usepackage{extsizes}
\usepackage{cmap}
\usepackage[T1]{fontenc}
\usepackage[english,russian]{babel}

\usepackage{amsmath}
\usepackage{graphicx}
\usepackage{subcaption}
\usepackage{fancyhdr}
\usepackage{lastpage}

\pagestyle{fancy}
\fancyhf{}

\rfoot{Страница \thepage \hspace{1pt} из \pageref{LastPage}}

\author{<>}
\title{<>}

\begin{document}

\maketitle
\newpage

<>

\end{document}
    ]],
            { i(1), i(2), i(0) }
        )
    ),
})
