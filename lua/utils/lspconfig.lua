local servers = {
  -- Compiled languages
  "clangd",
  "rust_analyzer",
  "gopls",
  -- Dynamic languages
  "lua_ls",
  "pyright",
  -- Script languages
  "bashls",
  -- Web development
  "html",
  "cssls",
  "emmet_language_server",
  "ts_ls",
  "tailwindcss",
  "svelte",
  -- Markup languages
  "yamlls",
  -- Other languages
  "jsonls",
  "neocmake",
  "sqlls",
}

-- LSP keymap configuration
local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

--- Lsp diagnostic configuration setup
local function lsp_diagnostic_config()
  ---@type vim.diagnostic.Opts
  local default_diagnostic_config = {
    virtual_text = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = true,
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config() or {}, "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end
end

-- LSP default on_attach configuration
local on_attach = function(_, bufnr)
  lsp_keymaps(bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

--- Lsp servers setup
local function lsp_servers_setup(lspconfig)
  for _, server in pairs(servers) do
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    local require_ok, settings = pcall(require, "config.lsp" .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", opts, settings)
    end

    lspconfig[server].setup(opts)
  end
end

-- Lspconfig plugin config function
local config = function()
  -- Import nvim-lspconfig
  local lspconfig = require("lspconfig")

  lsp_diagnostic_config()

  lsp_servers_setup(lspconfig)

  -- Mason-lspconfig plugin setup
  local require_ok, mason = pcall(require, "mason-lspconfig")
  if require_ok then
    mason.setup({
      automatic_installation = true,
      ensure_installed = servers,
    })
  end
end

return config
