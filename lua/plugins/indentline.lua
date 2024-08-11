local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
}

function M.config()
  -- local icons = require "../icons"

  require("ibl").setup {
    exclude = {
      buftypes = {
       "terminal",
       "nofile",
      },
      filetypes = {
        "help",
        "startify",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "text",
      },
    },
  }
end

return M
