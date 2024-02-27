local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			rust = { "rustfmt" },
			go = { "goimports", "gofumpt" },
			javascript = { "prettier" },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			scss = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
		},
		format_on_save = { timeout_ms = 500, fallback_lsp = true },
	},
}
