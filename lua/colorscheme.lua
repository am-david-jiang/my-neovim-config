local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 100,
}

function M.config()
  vim.cmd.colorscheme "catppuccin"
end

return M
