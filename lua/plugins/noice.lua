return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		---@type NoiceConfig
		opts = {
			notify = { position = "bottom" },
			messages = { view_history = "popup", position = "bottom" },
			commands = { history = { view = "popup" }, errors = { view = "split" } },
			lsp = {
				progress = { enabled = false },
				signature = { enabled = true },
				hover = { enabled = true, silent = true },
				documentation = { enabled = true },
			},
			views = {
				messages = {
					position = { row = -1, col = -1 },
				},
				popup = {
					position = { row = -1, col = -1 },
				},
				notify = {
					position = { row = -1, col = -1 },
				},
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
