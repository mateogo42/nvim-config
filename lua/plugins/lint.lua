return {
	"rshkarin/mason-nvim-lint",
	dependencies = {
		"mfussenegger/nvim-lint",
		config = function()
			-- type
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				python = { "ruff" },
				lua = { "selene" },
				go = { "golangcilint" },
				sh = { "shellcheck" },
			}

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	---@type mason-nvim-lint.MasonNvimLintSettings
	opts = { ensure_installed = { "eslint_d", "ruff", "selene", "golangci-lint" } },
}
