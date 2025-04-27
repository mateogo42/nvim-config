return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1001,
		config = function(_, opts)
			local colors = { "Red", "Blue", "Cyan", "Grey", "Azure", "Green", "Orange", "Purple", "Yellow" }
			for _, color in ipairs(colors) do
				local hl = string.format("BufferLineMiniIcons%s", color)
				opts.highlights[hl] = { link = hl .. "Selected" }
			end

			local diagnostics = { "Error", "Warning", "Info", "Hint" }
			for _, diagnostic in ipairs(diagnostics) do
				local hl = string.format("BufferLine%s", diagnostic)
				opts.highlights[hl] = { link = "Comment" }
				opts.highlights[hl .. "Selected"] = { fg = "${white}", bold = true }
			end
			require("onedarkpro").setup(opts)
			vim.cmd("colorscheme onedark")
		end,
		opts = {
			highlights = {
				StatusLine = { bold = false },
				StatusLineFile = { fg = "${yellow}", bold = true },
				StatusLineSeparator = { link = "Comment" },
				StatusLineMode = { fg = "${blue}" },
				StatusLineDiagnosticError = { fg = "${red}" },
				StatusLineDiagnosticWarn = { fg = "${yellow}" },
				StatusLineDiagnosticInfo = { fg = "${cyan}" },
				StatusLineDiagnosticHint = { fg = "${purple}" },
				StatusLineLsp = { fg = "${blue}", bold = true },
				StatusLineGitBranch = { fg = "${purple}" },
				BufferlineActive = { fg = "${white}", bold = true },
				BufferlineInactive = { link = "Comment" },
				BufferlineModified = { fg = "${green}" },
				GitSignsAdd = { fg = "${green}" },
				GitSignsChange = { fg = "${orange}" },
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
				SnacksPickerDir = { link = "Comment" },
				MasonNormal = { link = "Normal" },
				MasonBackdrop = { link = "Normal" },
				LazyNormal = { link = "Normal" },
				LazyBackdrop = { link = "Normal" },
				DiffChange = { fg = "${orange}" },
				BufferLineBackground = { link = "Comment" },
				BufferLineFill = { bg = "${black}" },
				BufferLineSeparator = { fg = "${black}", bg = "${black}" },
				BufferLineIndicatorSelected = { fg = "${black}" },
				BufferLineDiagnostic = { bg = "${red}" },
				BufferLineModified = { fg = "${green}", bg = "${black}" },
				BufferLineTruncMarker = { bg = "${black}", fg = "${red}" },
				BufferLineCloseButton = { fg = "${red}" },
				BufferLineCloseButtonSelected = { fg = "${red}", bold = true },
			},
		},
	},
}
