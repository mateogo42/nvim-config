-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- Show hover docs
	buf_set_keymap("n", "K", ":Lspsaga hover_doc<CR>", opts)
	-- Show signature help
	buf_set_keymap("n", "<C-k>", ":Lspsaga signature_help<CR>", opts)
	buf_set_keymap("n", "gr", ":Lspsaga rename<CR>", opts)
	buf_set_keymap("n", "gd", ":Lspsaga preview_definition<CR>", opts)
	buf_set_keymap("n", "<space>ca", ":Lspsaga code_action<CR>", opts)
	buf_set_keymap("v", "<space>ca", ":<C-U>Lspsaga range_code_action<CR>", opts)
end

local servers = {
	lua_ls = {
		Lua = {
			runtime = {
				-- LuaJIT in the case of Neovim
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "use", "awesome", "client", "root" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
					"/usr/share/awesome/lib",
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
	pyright = {},
}

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{
				"williamboman/mason.nvim",
				priority = 1000,
				config = function()
					require("mason").setup()
					require("mason-lspconfig").setup({
						ensure_installed = {
							"gopls",
							"lua_ls",
							"pyright",
							"rust_analyzer",
							"tsserver",
						},
					})
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },
			"nvim-lua/lsp-status.nvim",
			"tami5/lspsaga.nvim",
		},
		config = function()
			local path = os.getenv("PATH")
			local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"
			vim.fn.setenv("PATH", mason_bin .. ":" .. path)

			local lspconfig = require("lspconfig")
			local lsp_status = require("lsp-status")
			local saga = require("lspsaga")
			-- config that activates keymaps and enables snippet support
			local function make_config(server)
				local capabilities =
					require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
				capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)
				capabilities.textDocument.completion.completionItem.snippetSupport = true
				local config = {
					-- enable snippet support
					capabilities = capabilities,
					-- map buffer local keybindings when the language server attaches
					on_attach = on_attach,
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
					config.settings = servers[server]
					lspconfig[server].setup(config)
				end,
				["pyright"] = function()
					local config = make_config("pyright")
					config.root_dir = function(filename)
						return lspconfig.util.root_pattern(
							".git",
							"setup.py",
							"setup.cfg",
							"pyproject.toml",
							"requirements.txt"
						)(filename) or lspconfig.util.path.dirname(filename)
					end
					lspconfig.pyright.setup(config)
				end,
				["gopls"] = function()
					local config = make_config("gopls")
					config.cmd = { "gopls", "serve" }
					config.root_dir = function(filename)
						return lspconfig.util.root_pattern(".git", "go.mod")(filename)
							or lspconfig.util.path.dirname(filename)
					end
					config.settings = servers["gopls"]
					lspconfig.gopls.setup(config)
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
	},
}
