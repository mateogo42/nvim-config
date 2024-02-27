return {
	"lewis6991/gitsigns.nvim",
	config = function()
		vim.api.nvim_set_hl(0, "DiffChange", { bg = nil, fg = "#d19a66" })
		require("gitsigns").setup()
	end,
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
	},
}
