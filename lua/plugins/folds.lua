return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				local builtin = require("statuscol.builtin")
				require("statuscol").setup({
					relculright = true,
					init = function()
						vim.api.nvim_set_hl(0, "FoldColumn", { bg = nil, fg = "#5c6370" })
						vim.api.nvim_set_hl(0, "SignColumn", { bg = nil, fg = "#5c6370" })
					end,
					segments = {
						{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
						{ text = { "%s" }, click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					},
				})
			end,
		},
	},
	lazy = false,
	opts = {
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
	},
	init = function()
		vim.keymap.set("n", "zR", function()
			require("ufo").openAllFolds()
		end)
		vim.keymap.set("n", "zM", function()
			require("ufo").closeAllFolds()
		end)
	end,
}
