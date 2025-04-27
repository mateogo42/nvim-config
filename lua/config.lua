local M = {}
M.diagnostics = {
	icons = {
		[vim.diagnostic.severity.ERROR] = "",
		[vim.diagnostic.severity.WARN] = "",
		[vim.diagnostic.severity.INFO] = "",
		[vim.diagnostic.severity.HINT] = "󰌵",
	},
	icons_hl = {
		[vim.diagnostic.severity.ERROR] = "StatusLineDiagnosticError",
		[vim.diagnostic.severity.WARN] = "StatusLineDiagnosticWarn",
		[vim.diagnostic.severity.INFO] = "StatusLineDiagnosticInfo",
		[vim.diagnostic.severity.HINT] = "StatusLineDiagnosticHint",
	},
}

M.lsp_servers = {
	"astro",
	"bashls",
	"cssls",
	"css_variables",
	"docker_compose_language_service",
	"dockerls",
	"emmet_language_server",
	"gopls",
	"html",
	"jinja_lsp",
	"jsonls",
	"lua_ls",
	"prismals",
	"pyright",
	"ruff",
	"rust_analyzer",
	"tailwindcss",
	"taplo",
	"terraform_ls",
	"texlab",
	"ts_ls",
	"yamlls",
}

return M
