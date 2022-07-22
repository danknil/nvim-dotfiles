local default_colors = require('kanagawa.colors').setup()

local overrides = {
    StatusLine = { link = 'Normal' },

    TelescopeTitle = { bg = default_colors.waveBlue2, fg = default_colors.fujiWhite },
    TelescopePreviewTitle = { bg = default_colors.waveBlue1, fg = default_colors.fujiWhite },
    TelescopeNormal = { bg = default_colors.waveBlue2, fg = default_colors.fujiWhite },
    TelescopePrompt = { bg = default_colors.waveBlue2, fg = default_colors.fujiWhite },
    TelescopeBorder = { bg = default_colors.waveBlue1, fg = default_colors.waveBlue1 },
    TelescopePromptNormal = { bg = default_colors.waveBlue1, fg = default_colors.fujiWhite },
    TelescopePromptTitle = { bg = default_colors.waveBlue1, fg = default_colors.fujiWhite },
    TelescopePromptCounter = { bg = default_colors.waveBlue1, fg = default_colors.fujiWhite },
    TelescopePromptBorder = { bg = default_colors.waveBlue1, fg = default_colors.waveBlue1 },
    TelescopePreviewBorder = { bg = default_colors.waveBlue2, fg = default_colors.waveBlue2 },
    TelescopeResultsTitle = { bg = default_colors.sumiInk0, fg = default_colors.fujiWhite },
    TelescopeResultsNormal = { bg = default_colors.sumiInk0, fg = default_colors.fujiWhite },
    TelescopeResultsBorder = { bg = default_colors.sumiInk0, fg = default_colors.sumiInk0 },

    CursorWord = { bold = true, blend = 10 },

    PmenuSel = { bg = default_colors.sumiInk1, fg = 'NONE' },
    Pmenu = { fg = default_colors.fujiWhite, bg = default_colors.sumiInk0 },

    CmpItemAbbrDeprecated = { fg = default_colors.sumiInk4, bg = 'NONE', strikethrough = true },
    CmpItemAbbrMatch = { fg = default_colors.crystalBlue, bg = 'NONE', bold = true },
    CmpItemAbbrMatchFuzzy = { fg = default_colors.crystalBlue, bg = 'NONE', bold = true },

    CmpItemKindField = { fg = default_colors.carpYellow, bg = default_colors.winterYellow },
    CmpItemKindProperty = { fg = default_colors.carpYellow, bg = default_colors.winterYellow },
    CmpItemKindEvent = { fg = default_colors.carpYellow, bg = default_colors.winterYellow },

    CmpItemKindText = { fg = default_colors.springGreen, bg = default_colors.autumnGreen },
    CmpItemKindEnum = { fg = default_colors.springGreen, bg = default_colors.autumnGreen },
    CmpItemKindKeyword = { fg = default_colors.springGreen, bg = default_colors.autumnGreen },

    CmpItemKindConstant = { fg = default_colors.autumnYellow, bg = default_colors.roninYellow },
    CmpItemKindConstructor = { fg = default_colors.autumnYellow, bg = default_colors.roninYellow },
    CmpItemKindReference = { fg = default_colors.autumnYellow, bg = default_colors.roninYellow },

    CmpItemKindFunction = { fg = default_colors.fujiWhite, bg = default_colors.waveBlue1 },
    CmpItemKindStruct = { fg = default_colors.fujiWhite, bg = default_colors.waveBlue1 },
    CmpItemKindClass = { fg = default_colors.fujiWhite, bg = default_colors.waveBlue1 },
    CmpItemKindModule = { fg = default_colors.fujiWhite, bg = default_colors.waveBlue1 },
    CmpItemKindOperator = { fg = default_colors.fujiWhite, bg = default_colors.waveBlue1 },

    CmpItemKindVariable = { fg = default_colors.fujiWhite, bg = default_colors.sumiInk3 },
    CmpItemKindFile = { fg = default_colors.fujiWhite, bg = default_colors.sumiInk3 },

    CmpItemKindUnit = { bg = default_colors.autumnYellow, fg = default_colors.fujiWhite },
    CmpItemKindSnippet = { bg = default_colors.autumnYellow, fg = default_colors.fujiWhite },
    CmpItemKindFolder = { bg = default_colors.autumnYellow, fg = default_colors.fujiWhite },

    CmpItemKindMethod = { fg = default_colors.lightBlue, bg = default_colors.dragonBlue },
    CmpItemKindValue = { fg = default_colors.lightBlue, bg = default_colors.dragonBlue },
    CmpItemKindEnumMember = { fg = default_colors.lightBlue, bg = default_colors.dragonBlue },

    CmpItemKindInterface = { fg = default_colors.fujiWhite, bg = default_colors.autumnGreen },
    CmpItemKindColor = { fg = default_colors.fujiWhite, bg = default_colors.autumnGreen },
    CmpItemKindTypeParameter = { fg = default_colors.fujiWhite, bg = default_colors.autumnGreen },
}
require('kanagawa').setup { overrides = overrides }

vim.cmd [[ colorscheme kanagawa ]]
