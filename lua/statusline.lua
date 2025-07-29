local modes = {
    ['n'] = '[NORMAL]',
    ['no'] = '[NORMAL]',
    ['v'] = '[VISUAL]',
    ['V'] = '[VISUAL LINE]',
    ['␖'] = '[VISUAL BLOCK]',
    ['s'] = '[SELECT]',
    ['S'] = '[SELECT LINE]',
    ['␓'] = '[SELECT BLOCK]',
    ['i'] = '[INSERT]',
    ['ic'] = '[INSERT]',
    ['R'] = '[REPLACE]',
    ['Rv'] = '[VISUAL REPLACE]',
    ['c'] = '[COMMAND]',
    ['cv'] = '[VIM EX]',
    ['ce'] = '[EX]',
    ['r'] = '[PROMPT]',
    ['rm'] = '[MOAR]',
    ['r?'] = '[CONFIRM]',
    ['!'] = '[SHELL]',
    ['t'] = '[TERMINAL]',
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(' %s ', modes[current_mode]):upper()
end

local function update_mode_colors()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_color = '%#MiniStatuslineModeOther#'
    if current_mode == 'n' then
        mode_color = '%#MiniStatuslineModeNormal#'
    elseif current_mode == 'i' or current_mode == 'ic' then
        mode_color = '%#MiniStatuslineModeInsert#'
    elseif current_mode == 'v' or current_mode == 'V' or current_mode == '␖' then
        mode_color = '%#MiniStatuslineModeVisual#'
    elseif current_mode == 'R' then
        mode_color = '%#MiniStatuslineModeReplace#'
    elseif current_mode == 'c' then
        mode_color = '%#MiniStatuslineModeCommand#'
    end
    return mode_color
end

local function filepath()
    local fpath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
    if fpath == '' or fpath == '.' then
        return ' '
    end

    return string.format(' %%<%s/', fpath)
end

local function filename()
    local fname = vim.fn.expand '%:t'
    if fname == '' then
        return ''
    end
    return fname .. ' '
end

local function lineinfo()
    if vim.bo.filetype == 'alpha' then
        return ''
    end
    return ' %P %l:%c '
end

function StatusLine()
    return table.concat {
        '%#Statusline#',
        mode(),
        filepath(),
        filename(),
        '%m%r ',
        '%=',
        lineinfo(),
    }
end

vim.opt.statusline = '%!v:lua.StatusLine()'
