return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function(_, opts)
		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle()
		end)
		vim.keymap.set("n", "<leader>tw", function()
			require("trouble").toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>td", function()
			require("trouble").toggle("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>tq", function()
			require("trouble").toggle("quickfix")
		end)
		vim.keymap.set("n", "<leader>tl", function()
			require("trouble").toggle("loclist")
		end)
		vim.keymap.set("n", "gR", function()
			require("trouble").toggle("lsp_references")
		end)
		require("trouble").setup(opts)
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
