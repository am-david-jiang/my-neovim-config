local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
}

function M.config()
  local icons = require "../icons"

  local wk = require "which-key"
  wk.add {
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
  }

  require("gitsigns").setup {
    signs = {
      add = { text = icons.ui.BoldLineMiddle },
      change = { text = icons.ui.BoldLineDashedMiddle },
      delete = { text = icons.ui.TriangleShortArrowRight },
      topdelete = { text = icons.ui.TriangleShortArrowRight },
      changedelete = { text = icons.ui.BoldLineMiddle },
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  }

  vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitSignsAdd" })
  vim.api.nvim_set_hl(0, "GitSignsAddNr", { link = "GitSignsAddNr" })
  vim.api.nvim_set_hl(0, "GitSignsAddLn", { link = "GitSignsAddLn" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GitSignsChange" })
  vim.api.nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChangeNr" })
  vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChangeLn" })
  vim.api.nvim_set_hl(0, "GitSignsChangedelete", { link = "GitSignsChange" })
  vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { link = "GitSignsChangeNr" })
  vim.api.nvim_set_hl(0, "GitSignsChangedeleteLn", { link = "GitSignsChangeLn" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitSignsDelete" })
  vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDeleteNr" })
  vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "GitSignsDeleteLn" })
  vim.api.nvim_set_hl(0, "GitSIgnsTopdelete", { link = "GitSignsDelete" })
  vim.api.nvim_set_hl(0, "GitSIgnsTopdeleteNr", { link = "GitSignsDeleteNr" })
  vim.api.nvim_set_hl(0, "GitSIgnsTopdeleteLn", { link = "GitSignsDeleteLn" })
end

return M
