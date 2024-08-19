local M = {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  }
}

function M.config()
  local tools = {
    "prettierd", -- prettierd formatter
    "stylua", -- lua formatter
    "isort", -- python formatter
    "black", -- python formatter
    "pylint", -- python linter
    "eslint_d", -- js linter
  }

  require("mason").setup {
    ui = {
      border = "rounded",
      icons = {
        package_pending = " ",
        package_installed = "󰄳 ",
        package_uninstalled = " 󰚌",
      },

      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
        cancel_installation = "<C-c>",
      },
    },

    max_concurrent_installers = 10,
  }

  local mason_tool_installer = require("mason-tool-installer")

  mason_tool_installer.setup({
    ensure_installed = tools,
  })
end

return M
