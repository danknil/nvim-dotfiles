local function heirline_setup()
    local heirline = require 'heirline'
    local conditions = require 'heirline.conditions'
    local utils = require 'heirline.utils'

    local Align = { provider = '%=' }
    local Space = { provider = ' ' }

    local StatusLines = {
        hl = function()
            if conditions.is_active() then
                return 'StatusLine'
            else
                return 'StatusLineNC'
            end
        end,
        -- the first statusline with no condition, or which condition returns true is used.
        -- think of it as a switch case with breaks to stop fallthrough.
        fallthrough = false,
        -- statuslines
    }

    heirline.setup {}
end

return {
    {
        'rebelot/heirline.nvim',
        event = 'UIEnter',
        config = heirline_setup,
    },
}
