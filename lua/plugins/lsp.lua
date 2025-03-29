local illuminate_config = require("utils.illuminate")
local lspconfig_config = require("utils.lspconfig")

---@module "lazy"
---@type LazySpec
local M = {
  -- LSP highlight configuration
  {
    "RRethy/vim-illuminate",
    lazy = true,
    opts = illuminate_config,
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
  -- Lspconfig configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = lspconfig_config,
  },
  -- JSON Schemastore configuration
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
  -- Mason configuration
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonUpdate" },
    opts = {
      max_concurrent_installers = 10,
    },
  },
}

return M
