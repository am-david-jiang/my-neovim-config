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
  -- ts-comments configuration
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  -- Mini.pairs configuration
  {
    "echasnovski/mini.pairs",
    opts = {},
  },
  -- Mini.ai configuration
  {
    "echasnovski/mini.ai",
    opts = {},
  },
  -- Nvim-ts-autotag configuration
  {
    "windwp/nvim-ts-autotag",
    opts = {
      opts = {
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = true, -- Auto close on trailing </
      },
      per_filetype = {
        ["html"] = {
          enable_close = false,
        },
      },
    },
  },
}

return M
