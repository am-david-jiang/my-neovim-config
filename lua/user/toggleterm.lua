local toggleterm = require "toggleterm"

toggleterm.setup {
  open_mapping = [[<c-\>]],
  shading_factor = 2,
  direction = 'float',
  float_opts = {
    border = 'curved',
    -- width = 80,
    -- height = 45,
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  }
}
