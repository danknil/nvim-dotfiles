local get_hex = require("cokeline/utils").get_hex
local utils = require "core.utils"
local mappings = require "core.mappings"

require("cokeline").setup({
  show_if_buffers_are_at_least = 2,
  buffers = {
    -- -- A function to filter out unwanted buffers. Takes a buffer table as a
    -- -- parameter (see the following section for more infos) and has to return
    -- -- either `true` or `false`.
    -- -- default: `false`.
    -- filter_valid = function(buffer) -> true | false,

    -- Which buffer to focus when a buffer is deleted, `prev` focuses the
    -- buffer to the left of the deleted one while `next` focuses the one the
    -- right. Turned off by default.
    -- default: `false`
    focus_on_delete = 'prev',

    -- If set to `last` new buffers are added to the end of the bufferline,
    -- if `next` they are added next to the current buffer.
    -- default: 'last',
    new_buffers_position = 'last',
  },
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex("Normal", "fg")
         or get_hex("Comment", "fg")
    end,
    bg = "NONE",
  },

  components = {
    {
      text = function(buffer) return (buffer.index ~= 1) and "  " or " " end,
      fg = get_hex("Normal", "fg")
    },
    {
      text = function(buffer) return buffer.filename .. "" end,
      style = function(buffer) return buffer.is_focused and "bold" or nil end,
    },
    {
      text = "  ",
    },
  },
})

utils.load_mappings(mappings.bufferline, { silent = true })
