---@module "conform"
---@type conform.setupOpts
local formattingOpts = {
  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    svelte = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },

  format_after_save = {
    lsp_fallback = true,
    async = true,
    timeout_ms = 500,
  },
}

return formattingOpts
