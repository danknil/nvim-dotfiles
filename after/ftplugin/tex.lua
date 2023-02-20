local ts = require 'vim.treesitter'
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

local MATH_NODES = {
    displayed_equation = true,
    inline_formula = true,
    math_environment = true,
}

local function get_node_at_cursor()
    local parser = ts.get_parser(vim.api.nvim_get_current_buf(), 'latex')
    return utils.get_node_at_cursor(parser)
end

function in_text(check_parent)
    local node = get_node_at_cursor()
    while node do
        if node:type() == 'text_mode' then
            if check_parent then
                -- For \text{}
                local parent = node:parent()
                if parent and MATH_NODES[parent:type()] then
                    return false
                end
            end

            return true
        elseif MATH_NODES[node:type()] then
            return false
        end
        node = node:parent()
    end
    return true
end

function M.in_mathzone()
    local node = get_node_at_cursor()
    while node do
        if node:type() == 'text_mode' then
            return false
        elseif MATH_NODES[node:type()] then
            return true
        end
        node = node:parent()
    end
    return false
end

surround.buffer_setup {
    surrounds = {
        ['$'] = {
            add = { '$', '$' },
            find = '$*$',
            delete = '^(.)().-(.)()$',
        },
    },
    aliases = {},
}

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
