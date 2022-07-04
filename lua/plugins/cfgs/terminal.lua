require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return vim.o.lines * 0.4
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,

  direction = "horizontal"
}
