return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		---@type NoiceConfig
		opts = {
			messages = { view_history = "popup" },
			commands = { history = { view = "popup" }, errors = { view = "split" } },
			lsp = {
				progress = { enabled = false },
				signature = { enabled = true },
				hover = { enabled = true, silent = true },
				documentation = { enabled = true },
			},
			views = {
				messages = {
					position = { row = 14, col = "50%" },
				},
				popupmenu = {
					position = { row = 14, col = "50%" },
				},
				notify = {
					position = { row = 14, col = "50%" },
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
