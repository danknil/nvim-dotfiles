local maps = require "core.mappings"

require("core.packer").bootstrap()
require "plugins"

require "core.options"

maps.load_mappings(maps.general, { silent = true })
