return {
	"folke/trouble.nvim",
	config = function(_, opts)
		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle("diagnostics")
		end)
		vim.keymap.set("n", "<leader>ts", function()
			require("trouble").toggle("symbols")
		end)
		vim.keymap.set("n", "<leader>td", function()
			require("trouble").toggle("lsp")
		end)
		vim.api.nvim_set_hl(0, "TroubleNormal", { link = "Normal" })
		require("trouble").setup(opts)
	end,
	---@type trouble.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
