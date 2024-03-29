local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "lua", "python", "json", "c", "cpp", "javascript", "typescript" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
		enable = true,
	},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
  },
  indent = { enable = true, disable = { "yaml" } },
}

require("ts_context_commentstring").setup {}
vim.g.skip_ts_context_commentstring_module = true

if vim.loop.os_uname().sysname == "Windows_NT" then
  require('nvim-treesitter.install').compilers = { "clang", "cl", }
end
