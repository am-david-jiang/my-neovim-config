local illuminateConfig = require("utils.illuminate")

---@module "lazy"
---@type LazySpec
local M = {
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require("illuminate").configure(illuminateConfig)
    end,
  },
}

return M
