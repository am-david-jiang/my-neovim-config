local M = {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
}

local PYTHON_LINTERS = { "pylint" }
local FRONTEND_LINTERS = { "eslint_d" }

local ESLINT_CONFIG_FILENAME = {
	"eslint.config.js",
	"eslint.config.mjs",
	"eslint.config.cjs",
}

function isEslintConfigExisted()
	for _, filename in ipairs(ESLINT_CONFIG_FILENAME) do
		local configPath = vim.uv.cwd() .. "/" .. filename
		if vim.uv.fs_stat(configPath) then
			return true
		end
	end

	return false
end

function M.config()
	local lint = require("lint")

	lint.linters_by_ft = {
		python = PYTHON_LINTERS,
	}

	local frontend_lint_augroup = vim.api.nvim_create_augroup("frontend_lint", { clear = true })
	local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })

	if isEslintConfigExisted() then
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = frontend_lint_augroup,
			pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.svelte" },
			callback = function()
				lint.try_lint(FRONTEND_LINTERS)
			end,
		})
	end

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_group,
		callback = function()
			lint.try_lint()
		end,
	})
end

return M
