return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type fun(_, opts: snacks.Config): nil
	config = function(_, opts)
		local colors = require("onedark.colors")
		vim.api.nvim_set_hl(0, "FoldColumn", { link = "Comment" })
		vim.api.nvim_set_hl(0, "Folded", { link = "Comment" })
		vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = colors.purple })
		vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = colors.purple })
		vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = colors.cyan })

		vim.api.nvim_set_hl(0, "SnacksPicker", { bg = colors.bg0 })
		vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = colors.fg })
		vim.api.nvim_set_hl(0, "SnacksPickerPrompt", { fg = colors.blue })
		vim.api.nvim_set_hl(0, "SnacksPickerMatch", { fg = nil, bg = colors.bg0 })
		vim.api.nvim_set_hl(0, "SnacksPickerSearch", { fg = nil, bg = colors.bg0 })
		require("snacks").setup(opts)
	end,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		dashboard = {
			enabled = true,
			sections = {
				{
					section = "terminal",
					cmd = "pokemon-colorscripts --name gengar --no-title; sleep .1",
					random = 10,
					-- pane = 2,
					indent = 13,
					height = 20,
				},
				{ section = "header", hl = "icon" },
				{ section = "startup", padding = 5 },
				{ text = { { "Quit [q]", align = "center", hl = "header" } }, key = "q", action = ":qa" },
			},
		},
		statuscolumn = {
			left = function(win, buf)
				local is_dashboard = vim.bo[buf].filetype == "snacks_dashboard"
				return is_dashboard and { "mark" } or { "mark", "sign" }
			end, -- priority of signs on the left (high to low)
			right = function(win, buf)
				local is_dashboard = vim.bo[buf].filetype == "snacks_dashboard"
				return is_dashboard and { "git" } or { "fold", "git" }
			end,
			folds = {
				open = true, -- show open fold icons
				git_hl = false, -- use Git Signs hl for fold icons
			},
			git = {
				-- patterns to match Git signs
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50, -- refresh at most every 50ms
		},
		picker = {
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
					layout = { preset = "select" },
				})
			end,
			desc = "Find files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({
					layout = { preset = "select" },
				})
			end,
			desc = "List buffers",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep_word()
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
	},
}
