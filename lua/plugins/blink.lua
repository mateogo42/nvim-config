return {
	{
		"folke/lazydev.nvim",
		cmd = "LazyDev",
		event = "VeryLazy",
		dependencies = {
			{ "gonstoll/wezterm-types" },
		},
		ft = "lua", -- only load on lua files
		---@type lazydev.Config
		opts = {
			library = {
				"~/.local/share/nvim/lazy/",
				{ path = "snacks.nvim", words = { "Snacks" } },
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "wezterm-types", mods = { "wezterm" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		lazy = false,
		version = "v0.*",
		dependencies = {
			{ "echasnovski/mini.icons" },
		},
		---@type blink.cmp.Config
		opts = {
			completion = {
				trigger = {
					show_on_insert_on_trigger_character = false,
					show_on_trigger_character = false,
				},
				menu = {
					auto_show = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
					border = "single",
					draw = {
						columns = {
							{ "kind_icon", "label", gap = 1 },
							{ "kind" },
						},
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
									return kind_icon
								end,
								highlight = function(ctx)
									local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
									return hl
								end,
							},
							kind = {
								ellipsis = false,
								highlight = function(ctx)
									local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
									return hl
								end,
							},
						},
					},
				},
				documentation = { auto_show = true, window = { border = "single" } },
			},
			keymap = {
				preset = "default",
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<CR>"] = { "accept", "fallback" },
			},
			sources = {
				default = { "lazydev", "lsp", "path", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
			-- cmdline = {
			-- 	sources = function()
			-- 		local type = vim.fn.getcmdtype()
			-- 		-- Search forward and backward
			-- 		if type == "/" or type == "?" then
			-- 			return { "buffer" }
			-- 		end
			-- 		-- Commands
			-- 		if type == ":" then
			-- 			return { "cmdline" }
			-- 		end
			-- 		return {}
			-- 	end,
			-- },
			signature = { enabled = true },
		},
		config = function(_, opts)
			local colors = require("onedark.colors")
			local blink = require("blink.cmp")
			vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = colors.bg3 })
			vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "Normal" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "Normal" })
			vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = colors.bg0 })
			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = colors.bg0 })
			vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = colors.bg0 })
			blink.setup(opts)
		end,
	},
}
