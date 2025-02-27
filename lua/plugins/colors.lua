return {
	{
		"navarasu/onedark.nvim",
		lazy = false,
		init = function()
			require("onedark").load()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
	},
}
