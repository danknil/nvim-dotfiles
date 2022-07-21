local maps = require "mappings"

require "pkg_manager"

require "autocmds"
require "options"
require "plugins"

maps:load_mappings("general", { silent = true, noremap = true })
