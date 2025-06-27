return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = {
			enabled = true,
			sections = {
				{
					section = "terminal",
					cmd = "pokemon-colorscripts --name gengar --no-title; sleep .1",
					indent = 13,
					height = 18,
				},
				{ section = "header", hl = "icon" },
				{ section = "startup", padding = 5 },
				{ text = { { "Quit [q]", align = "center", hl = "header" } }, key = "q", action = ":qa" },
			},
		},
		statuscolumn = {
			left = { "git" },
			right = { "fold" },
			folds = {
				open = true,
				git_hl = false,
			},
			git = {
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50,
		},
		picker = {
			layouts = {
				default = {
					layout = {
						backdrop = { blend = 40, bg = "" },
					},
				},
				select = {
					layout = {
						backdrop = { blend = 40, bg = "" },
						border = "rounded",
					},
				},
			},
			prompt = "   ",
			formatters = {
				file = {
					filename_first = true,
				},
			},
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				Snacks.picker.files({
					hidden = true,
					layout = { preset = "select" },
				})
			end,
			desc = "Find files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({
					focus = "list",
					layout = {
						preset = "select",
						layout = {
							position = "left",
							border = false,
							width = 35,
						},
					},
				})
			end,
			desc = "List buffers",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep({ layout = "default" })
			end,
			desc = "Grep",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep_word({ layout = "default" })
			end,
			desc = "Grep current word or selection",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.highlights()
			end,
			desc = "List highlight groups",
		},
		{
			"<leader>fu",
			function()
				Snacks.picker.lsp_references()
			end,
		},
		{
			"<leader>fi",
			function()
				Snacks.picker.lsp_implementations()
			end,
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
		},
	},
}
