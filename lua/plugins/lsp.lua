return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
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
				end,
			},
			{
				"Wansmer/symbol-usage.nvim",
				event = "LspAttach",
				config = function(_, opts)
					require("symbol-usage").setup(opts)
				end,
			},
		},
		config = function()
			local config = require("config")
			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = config.diagnostics.icons,
					numhl = config.diagnostics.icons_hl,
				},
			})
			local servers = require("config").lsp_servers

			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end
		end,
	},
}
