return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- If you want devicons
		"MunifTanjim/nui.nvim",
	},
	config = function(_, opts)
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeSignColumn", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeStatusLine", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#282c34", bg = "#282c34" })
		require("neo-tree").setup(opts)
	end,
	opts = {
		window = {
			mappings = {
				["<Tab>"] = "next_source",
				["<S-Tab>"] = "prev_source",
			},
		},
	},
}
