local installed = {
  -- Compiled languages
  "c",
  "cpp",
  "cmake",
  "rust",
  -- Dynamic languages
  "lua",
  "python",
  -- Script languages
  "bash",
  "fish",
  -- Web development
  "html",
  "css",
  "javascript",
  "typescript",
  "tsx",
  -- Markup languages
  "yaml",
  "toml",
  -- Markdown language for documentation
  "markdown",
  "markdown_inline",
  -- Other
  "sql",
}

---@module "nvim-treesitter.configs"
---@type TSConfig
local opts = {
  modules = {},
  ensure_installed = installed,
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
}

local M = function()
  require("nvim-treesitter.configs").setup(opts)
end

return M
