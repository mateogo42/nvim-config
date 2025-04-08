return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1001,
		config = function(_, opts)
			require("onedarkpro").setup(opts)
			vim.cmd("colorscheme onedark")
		end,
		opts = {
			highlights = {
				GitSignsAdd = { fg = "${green}" },
				GitSignsChange = { fg = "${yellow}" },
				GitSignsDelete = { fg = "${red}" },
				BlinkCmpMenuSelection = { link = "Visual" },
				BlinkCmpMenu = { link = "Normal" },
				BlinkCmpMenuBorder = { link = "Normal" },
				BlinkCmpDoc = { bg = "${bg}" },
				BlinkCmpDocBorder = { bg = "${bg}" },
				BlinkCmpDocSeparator = { bg = "${bg}" },
				HoverNormal = { link = "Normal" },
				NormalFloat = { bg = "${bg}" },
				FloatBorder = { link = "Normal" },
				FoldColumn = { link = "Comment" },
				Folded = { link = "Comment" },
				SnacksBackdrop = { bg = "${bg}" },
				SnacksDashboardHeader = { fg = "${purple}" },
				SnacksDashboardFooter = { fg = "${purple}" },
				SnacksDashboardSpecial = { fg = "${cyan}" },
				SnacksPicker = { bg = "${bg}" },
				SnacksPickerPrompt = { fg = "${blue}" },
				SnacksPickerMatch = { fg = "${yellow}" },
				SnacksPickerSearch = { link = "Visual" },
				MasonNormal = { link = "Normal" },
				MasonBackdrop = { link = "Normal" },
				LazyNormal = { link = "Normal" },
				LazyBackdrop = { link = "Normal" },
			},
		},
	},
}
