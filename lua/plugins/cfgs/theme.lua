local default_colors = require("kanagawa.colors").setup()

local overrides = {
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
}

require'kanagawa'.setup({ overrides = overrides })

vim.cmd [[ colorscheme kanagawa ]]
