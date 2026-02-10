require'rose-pine'.setup {
	variant = "main",
    dark_variant = "main",

    enable = {
        terminal = true,
    },

    styles = {
        bold = false,
        italic = false,
        transparency = false,
    },
}

vim.cmd [[
	colorscheme rose-pine
	:hi statusline guibg=none
]]
