local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 100,
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}

return M
