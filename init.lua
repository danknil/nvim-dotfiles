require 'pkg_manager'
require 'impatient'

require 'autocmds'
require 'options'
require 'plugins'

local maps = require 'mappings'
maps:load_mappings('general', { silent = true })
