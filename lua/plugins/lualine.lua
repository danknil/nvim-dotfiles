return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- Get the colors for the current theme
        local lualine = require 'lualine'
        local colors = require('kanagawa.colors').setup()
        local palette = colors.palette
        local theme = colors.theme

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand '%:t') ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand '%:p:h'
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Config
        local config = {
            options = {
                -- Disable sections and component separators
                component_separators = '',
                section_separators = '',
                theme = {
                    -- We are going to use lualine_c an lualine_x as left and
                    -- right section. Both are highlighted by c theme .  So we
                    -- are just setting default looks o statusline
                    normal = { c = { fg = theme.fg, bg = theme.bg } },
                    inactive = { c = { fg = theme.fg, bg = theme.bg } },
                },
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x at right section
        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        ins_left {
            -- mode component
            function()
                return ' '
            end,
            color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                    n = theme.ui.fg_dim,
                    i = theme.diag.ok,
                    v = theme.diag.info,
                    ['␖'] = theme.diag.info,
                    V = theme.diag.info,
                    c = theme.syn.number,
                    no = theme.ui.fg_dim,
                    s = theme.syn.special1,
                    S = theme.syn.special1,
                    ['␓'] = theme.syn.special1,
                    ic = theme.diag.warning,
                    R = theme.syn.keyword,
                    Rv = theme.syn.keyword,
                    cv = theme.ui.fg_dim,
                    ce = theme.ui.fg_dim,
                    r = theme.diag.hint,
                    rm = theme.diag.hint,
                    ['r?'] = theme.diag.hint,
                    ['!'] = theme.ui.fg_dim,
                    t = theme.ui.fg_dim,
                }
                return { bg = mode_color[vim.fn.mode()] }
            end,
            padding = { left = 0, right = 1 },
        }

        ins_left {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = 'bold' },
        }

        ins_left {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.cyan },
            },
        }

        ins_left {
            require('noice').api.statusline.mode.get,
            cond = require('noice').api.statusline.mode.has,
            color = { fg = '#ff9e64' },
        }

        ins_right {
            'branch',
            icon = '',
            color = { fg = colors.violet, gui = 'bold' },
        }

        ins_right {
            'diff',
            -- Is it me or the symbol for modified us really weird
            symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        }

        ins_right { 'location' }

        ins_right { 'progress', color = { fg = colors.fg, gui = 'bold' } }

        ins_right {
            -- mode component
            function()
                return ' '
            end,
            color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                    n = theme.ui.fg_dim,
                    i = theme.diag.ok,
                    v = theme.diag.info,
                    ['␖'] = theme.diag.info,
                    V = theme.diag.info,
                    c = theme.syn.number,
                    no = theme.ui.fg_dim,
                    s = theme.syn.special1,
                    S = theme.syn.special1,
                    ['␓'] = theme.syn.special1,
                    ic = theme.diag.warning,
                    R = theme.syn.keyword,
                    Rv = theme.syn.keyword,
                    cv = theme.ui.fg_dim,
                    ce = theme.ui.fg_dim,
                    r = theme.diag.hint,
                    rm = theme.diag.hint,
                    ['r?'] = theme.diag.hint,
                    ['!'] = theme.ui.fg_dim,
                    t = theme.ui.fg_dim,
                }
                return { bg = mode_color[vim.fn.mode()] }
            end,
            padding = { left = 1, right = 0 },
        }

        -- Now don't forget to initialize lualine
        lualine.setup(config)
    end,
}
