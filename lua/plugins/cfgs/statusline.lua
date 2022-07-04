local custom_onedark = require "lualine.themes.onedark"
custom_onedark.normal.b.bg = "#1f2329"
custom_onedark.normal.c.bg = "#1f2329"

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = custom_onedark,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = { {'mode', fmt = function(_) return " " end, padding = 0} },
    lualine_b = {},
    lualine_c = {'filename', 'diff'},
    lualine_x = {'diagnostics', 'progress', 'location'},
    lualine_y = {},
    lualine_z = { {'mode', fmt = function(_) return " " end, padding = 0} },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
