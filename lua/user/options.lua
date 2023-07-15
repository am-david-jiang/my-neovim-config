local options = {
  backup = false,
  swapfile = false,
  writebackup = false,

  clipboard = "unnamedplus",
  cmdheight = 2,
  showmode = false,
  pumheight = 10,
  completeopt = { "menuone", "noselect" },
  fileencoding = "utf-8",
  conceallevel = 0,

  hlsearch = true,
  ignorecase = true,
  smartcase = true,
  
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,
  cindent = true,

  splitbelow = true,
  splitright = true,

  timeoutlen = 300,
  updatetime = 300,

  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,

  signcolumn = "yes",
  wrap = true,
  linebreak = true,
  mouse = "a",
  guifont = "FiraCode Nerd Font:h11",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use
