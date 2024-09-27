local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"javascript",
			"typescript",
			"c",
			"cpp",
			"cmake",
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
