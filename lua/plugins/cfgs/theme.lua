local default_colors = require("kanagawa.colors").setup()

local overrides = {
  TelescopePrompt = { bg = default_colors.waveBlue2, fg = default_colors.sumiInk4 },
  TelescopePromptBorder = { bg = default_colors.waveBlue2, fg = default_colors.sumiInk4 },
  -- TelescopeResultsNormal = default_colors.sumiInk0,
  -- TelescopeResultsBorder = default_colors.sumiInk0,
}

require'kanagawa'.setup({ overrides = overrides })
