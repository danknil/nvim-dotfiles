local M = {}

M.load_mappings = function(mappings, opts)
  for mode, mappings_list in pairs(mappings) do
    for mapping, func in pairs(mappings_list) do
      vim.keymap.set(mode, mapping, func, opts)
    end
  end
end

return M
