local maps = require "mappings"

require "autocmds"
require "options"
require "pkg_manager"
require "plugins"

maps:load_mappings("general", { silent = true, noremap = true })
