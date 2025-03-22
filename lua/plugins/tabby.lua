local M = {
	"nanozuki/tabby.nvim",
	event = "VeryLazy", -- if you want lazy load, see below
	dependencies = "nvim-tree/nvim-web-devicons",
}

function M.config()
	require("tabby").setup({
		preset = "active_wins_at_tail",
	})
end

return M
