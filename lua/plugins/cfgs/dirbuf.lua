require"dirbuf".setup {
  write_cmd = "DirbufSync -confirm",
  sort_order = "directories_first",
}

require"core.utils".load_mappings(require"core.mappings".dirbuf, { noremap = true, silent = true })
