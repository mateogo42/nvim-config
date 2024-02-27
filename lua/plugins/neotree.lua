return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- If you want devicons
		"MunifTanjim/nui.nvim",
	},
	opts = {
		source_selector = {
			winbar = true,
			sources = { -- table
				{
					source = "filesystem", -- string
					display_name = " 󰉓 Files ", -- string | nil
				},
				{
					source = "git_status", -- string
					display_name = " 󰊢 Git ", -- string | nil
				},
			},
			separator = "",
			highlight_tab = "Comment",
			highlight_tab_active = "Normal",
			highlight_background = "Normal",
			highlight_separator = "Comment",
			highlight_separator_active = "Normal",
		},
		window = {
			mappings = {
				["<Tab>"] = "next_source",
				["<S-Tab>"] = "prev_source",
			},
		},
	},
}
