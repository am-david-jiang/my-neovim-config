local colorscheme = 'everforest'

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.everforest_background = 'hard'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. "is not found!")
  return
end
