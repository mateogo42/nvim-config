return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			rust = { "rustfmt" },
			go = { "goimports", "gofumpt" },
			astro = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			scss = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			ocaml = { "ocamlformat" },
			sh = { "shfmt" },
		},
		format_on_save = { timeout_ms = 500, fallback_lsp = true },
	},
}
