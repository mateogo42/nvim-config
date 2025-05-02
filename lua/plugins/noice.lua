return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					stages = "slide",
					top_down = false,
				},
			},
		},
		---@type NoiceConfig
		opts = {
			notify = { position = "bottom" },
			messages = { view = "mini" },
			commands = { history = { view = "popup" }, errors = { view = "split" } },
			lsp = {
				progress = { enabled = true },
				signature = { enabled = true },
				hover = { enabled = true, silent = true },
				documentation = { enabled = true },
			},
			presets = { inc_rename = true, lsp_doc_border = true },
			routes = {
				{ filter = { event = { "msg_show" }, kind = "", find = "written" }, opts = { skip = true } },
				{ filter = { event = { "msg_show" }, kind = "", find = "lines" }, opts = { skip = true } },
				{ filter = { event = { "msg_show" }, kind = "emsg" }, opts = { skip = true } },
				-- { filter = { event = { "notify" } }, opts = { skip = true } },
			},
		},
	},
}
