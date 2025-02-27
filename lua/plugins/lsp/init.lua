local servers = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
					pathStrict = true,
				},
				diagnostics = {
					globals = { "vim", "require" },
					disable = { "missing-fields" },
				},
				workspace = {
					library = { vim.env.VIMRUNTIME },
					checkThirdParty = false,
				},
				hint = {
					enable = true,
				},
				format = {
					enable = true,
					defaultConfig = {
						indent_style = "space",
						indent_size = "2",
					},
				},
			},
		},
	},
	gopls = {
		analyses = {
			unusedparams = true,
		},
		staticcheck = true,
		linksInHover = false,
		codelenses = {
			generate = true,
			gc_details = true,
			regenerate_cgo = true,
			tidy = true,
			upgrade_dependency = true,
			vendor = true,
		},
		usePlaceholders = true,
	},
	["rust_analyzer"] = {
		checkOnSave = {
			command = "clippy",
		},
	},
	ruff = {
		trace = "messages",
		init_options = {
			settings = {
				lint = { enable = false },
				logLevel = "debug",
			},
		},
	},
	pyright = {
		settings = {
			pyright = {
				disableOrganizeImports = true,
			},
			python = {
				analysis = {
					ignore = { "*" },
					typeCheckingMode = "off",
				},
			},
		},
	},
	ts_ls = {
		init_options = {
			preferences = {
				disableSuggestions = true,
			},
		},
	},
}

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "saghen/blink.cmp" },
			{
				"williamboman/mason.nvim",
				priority = 1000,
				config = function()
					require("mason").setup()
					require("mason-lspconfig").setup({
						ensure_installed = {
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
			"nvim-lua/lsp-status.nvim",
			{
				"nvimdev/lspsaga.nvim",
				opts = {
					ui = {
						code_action = " 󰠠",
					},
					lightbulb = {
						enable = true,
						sign = false,
					},
				},
				config = function(_, opts)
					local MiniIcons = require("mini.icons")
					MiniIcons.mock_nvim_web_devicons()
					require("lspsaga").setup(opts)
				end,
				dependencies = {
					"nvim-treesitter/nvim-treesitter", -- optional
					"echasnovski/mini.icons",
				},
			},
			{
				"Wansmer/symbol-usage.nvim",
				event = "LspAttach",
				config = function()
					require("symbol-usage").setup()
				end,
			},
		},
		config = function()
			vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "LspDiagnosticsDefaultError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "LspDiagnosticsDefaultWarning" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "LspDiagnosticsDefaultInformation" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "LspDiagnosticsDefaultHint" })

			local lspconfig = require("lspconfig")
			local lsp_status = require("lsp-status")

			-- config that activates keymaps and enables snippet support
			local function make_config(server)
				local capabilities = lsp_status.capabilities
				capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
				capabilities.textDocument.completion.completionItem.snippetSupport = true
				local config = {
					-- enable snippet support
					capabilities = capabilities,
				}

				if lsp_status.extensions[server] then
					config.handlers = lsp_status.extensions[server].setup()
				end

				return config
			end
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				function(server)
					local config = make_config(server)
					config = vim.tbl_extend("keep", config, servers[server] or {})
					lspconfig[server].setup(config)
				end,
			})
		end,
	},
	{ "williamboman/mason.nvim" },
}
