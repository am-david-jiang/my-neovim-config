local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
}

function M.config()
	require("toggleterm").setup({
		size = 20,
		open_mapping = [[<c-\>]],
		direction = "float",
		float_opts = {
			border = "rounded",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
		winbar = {
			enabled = true,
			name_formatter = function(term) --  term: Terminal
				return term.count
			end,
		},
	})
end

return M
