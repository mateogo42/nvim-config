return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_impors" },
			rust = { "rustfmt" },
			go = { "goimports", "gofumpt" },
			javascript = { "prettier" },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			scss = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			ocaml = { "ocamlformat" },
		},
		format_on_save = { timeout_ms = 500, fallback_lsp = true },
	},
}
