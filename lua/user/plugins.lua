-- Install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

	-- Colorscheme
	"sainnhe/everforest",

	"hrsh7th/nvim-cmp",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp", -- Adds LSP completion capabilities
	"hrsh7th/cmp-nvim-lua",

	-- Null-ls
	"jose-elias-alvarez/null-ls.nvim",

	-- SchemaStore.nvim plugin for lua LSP schema configuration
	"b0o/SchemaStore.nvim",
	-- Snippet Engine & its associated nvim-cmp source
	"L3MON4D3/LuaSnip",
	-- Adds a number of user-friendly snippets
	"rafamadriz/friendly-snippets",

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim", -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim", -- simple to use language server installer
	"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions

	-- Telescope: A Plugin for Fuzzy Finding
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
		},
	},

	-- Tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- Illuminate: Automatic highlighting
	{ "RRethy/vim-illuminate" },

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},

	-- Comment.nvim: Commentation Plugin
	{ "numToStr/Comment.nvim" },

	-- Git
	{ "lewis6991/gitsigns.nvim" },

	-- Nvim-Tree
	{ "kyazdani42/nvim-tree.lua", dependencies = {
		"nvim-tree/nvim-web-devicons",
	} },

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Trouble.nvim
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},

	-- Indent Guides
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },

	-- Alpha Dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}, {})
