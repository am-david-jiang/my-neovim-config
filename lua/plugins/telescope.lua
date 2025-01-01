local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			lazy = true,
		},
	},
}

function M.config()
	local wk = require("which-key")
	wk.add({
		{ "<leader>bb", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
		{ "<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
		{ "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
		{ "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
		{ "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Text" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
		{ "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
	})

	local icons = require("../icons")
	local actions = require("telescope.actions")

	require("telescope").setup({
		defaults = {
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. " ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			path_display = { "smart" },
			color_devicons = true,
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},
		},

		mapping = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<esc>"] = actions.close,
			},
			n = {
				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["q"] = actions.close,
			},
		},

		pickers = {
			colorscheme = {
				enable_preview = true,
			},
		},

		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
	})
end

return M
