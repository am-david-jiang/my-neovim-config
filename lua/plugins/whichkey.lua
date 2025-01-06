local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")

	local mappings = {
		{ "<leader>;", "<cmd>tabnew | terminal<CR>", desc = "Term" },
		{ "<leader>T", group = "Treesitter" },
		{ "<leader>b", group = "Buffers" },
		{ "<leader>d", group = "Debug" },
		{ "<leader>f", group = "Find" },
		{ "<leader>g", group = "Git" },
		{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
		{ "<leader>l", group = "LSP" },
		{ "<leader>p", group = "Plugins" },
		{ "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
		{ "<leader>t", group = "Test" },
		{ "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
		{ "<leader>x", group = "Trouble.nvim" },
	}

	local tab_mappings = {
		{ "<leader>t", group = "Tab" },
		{ "<leader>tN", "<cmd>tabnew %<cr>", desc = "New Tab" },
		{ "<leader>th", "<cmd>tabprevious<cr>", desc = "Previous Tab" },
		{ "<leader>tl", "<cmd>tabnext<cr>", desc = "Next Tab" },
		{ "<leader>tk", "<cmd>tabprevious<cr>", desc = "Previous Tab" },
		{ "<leader>tj", "<cmd>tabnext<cr>", desc = "Next Tab" },
		{ "<leader>ta", "<cmd>tabfirst<cr>", desc = "Go to First Tab" },
		{ "<leader>te", "<cmd>tablast<cr>", desc = "Go to Last Tab" },
		{ "<leader>tH", "<cmd>-tabmove<cr>", desc = "Move Tab Left" },
		{ "<leader>tL", "<cmd>+tabmove<cr>", desc = "Move Tab Right" },
		{ "<leader>tc", "<cmd>tabclose<cr>", desc = "Close Current Tab" },
		{ "<leader>tn", "<cmd>$tabnew<cr>", desc = "New Empty Tab" },
		{ "<leader>to", "<cmd>tabonly<cr>", desc = "Close Other Tabs" },
	}

	wk.add(mappings)
	wk.add(tab_mappings)
end

return M
