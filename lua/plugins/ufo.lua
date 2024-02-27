return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				vim.api.nvim_set_hl(0, "FoldColumn", { link = "Comment" })
				local builtin = require("statuscol.builtin")
				require("statuscol").setup({
					relculright = true,
					segments = {
						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						{ text = { "%s" }, click = "v:lua.ScLa" },
						{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
					},
				})
			end,
		},
	},
	opts = {
		provider_selector = function()
			return { "treesitter", "indent" }
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
	event = "BufReadPost",
}
