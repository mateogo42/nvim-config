local servers = require("plugins.lsp.servers")
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "saghen/blink.cmp" },
			{
				"williamboman/mason.nvim",
				priority = 1000,
				opts = {
					ui = {
						backdrop = 40,
						border = "rounded",
						icons = {
							package_installed = "",
						},
					},
				},
				config = function(_, opts)
					require("mason").setup(opts)
					require("mason-lspconfig").setup({
						ensure_installed = {
							"pyright",
							"gopls",
							"lua_ls",
							"ruff",
							"rust_analyzer",
							"ts_ls",
						},
					})
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"Wansmer/symbol-usage.nvim",
				event = "LspAttach",
				config = function(_, opts)
					require("symbol-usage").setup(opts)
				end,
			},
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "󰌵",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
						[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
						[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
						[vim.diagnostic.severity.HINT] = "DiagnosticSignHing",
					},
				},
			})

			local lspconfig = require("lspconfig")
			local blink = require("blink.cmp")

			local function on_attach()
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true })
				-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true })
			end
			local function make_config()
				local capabilities = vim.tbl_deep_extend(
					"force",
					vim.lsp.protocol.make_client_capabilities(),
					blink.get_lsp_capabilities()
				)
				local config = {
					on_attach = on_attach,
					capabilities = capabilities,
				}

				return config
			end
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				---@param server string
				function(server)
					local config = make_config()
					config = vim.tbl_extend("keep", config, servers[server] or {})
					lspconfig[server].setup(config)
				end,
			})
		end,
	},
}
