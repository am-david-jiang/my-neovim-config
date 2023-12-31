local servers = {
  "lua_ls",
  "pyright",
  "jsonls",
  "clangd",
  "tsserver",
}

local mason_lspconfig_opt = {
  ensure_installed = servers,
  automatic_installation = true,
}

require("mason").setup()
require("mason-lspconfig").setup(mason_lspconfig_opt)

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
