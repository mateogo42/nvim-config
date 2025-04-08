return {
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
