local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			-- Compiled languages
			"c",
			"cpp",
			"cmake",
			"rust",
			-- Dynamic languages
			"lua",
			"python",
			-- Script languages
			"bash",
			"fish",
			-- Web development
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			-- Markup languages
			"yaml",
			"toml",
			-- Markdown language for documentation
			"markdown",
			"markdown_inline",
		},
		auto_install = true,
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = {
			enable = true,
		},
	})
end

return M
