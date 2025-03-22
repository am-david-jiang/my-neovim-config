---@module "lazy"
---@type LazySpec[]
local M = {
  -- Lazydev configuration
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    ---@module "lazydev"
    ---@type lazydev.Config
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
    dependencies = {
      { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    },
  },
}

return M
