local heirline = require 'heirline'

local function get_statusline()
    return {}
end

local function get_winbar()
    return {}
end

local function get_tabline()
    return {}
end

local function get_statuscolumn()
    return {}
end

return {
    {
        'rebelot/heirline.nvim',
        event = 'UiEnter',
        config = function()
            heirline.setup {
                statusline = get_statusline(),
                winbar = get_winbar(),
                tabline = get_tabline(),
                statuscolumn = get_statuscolumn(),
            }
        end,
    },
}
