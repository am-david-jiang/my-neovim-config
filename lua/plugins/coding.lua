local treesitterUtils = require("utils.treesitter")
local blink_config = require("utils.blink")

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
    event = "InsertEnter",
    opts = {},
  },
  -- Mini.ai configuration
  {
    "echasnovski/mini.ai",
    event = "InsertEnter",
    opts = {},
  },
  -- Nvim-ts-autotag configuration
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
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
  -- Treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      ensure_installed = treesitterUtils.installed,
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      },
    },
  },
  -- Completion configuration
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
      },
    },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = blink_config,
    opts_extend = { "sources.default" },
    config = function(_, opts)
      require("luasnip.loaders.from_vscode").lazy_load()

      require("blink.cmp").setup(opts)
    end,
  },
}

return M
