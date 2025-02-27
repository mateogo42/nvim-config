return {
	"kevinhwang91/nvim-ufo",
	lazy = false,
	priority = 1000,
	dependencies = {
		"kevinhwang91/promise-async",
	},
	opts = {
		provider_selector = function()
			return { "treesitter" }
		end,
	},
	init = function()
		vim.keymap.set("n", "zO", function()
			require("ufo").openAllFolds()
		end, {})
		vim.keymap.set("n", "zC", function()
			require("ufo").closeAllFolds()
		end, {})
	end,
	event = "UiEnter",
}
