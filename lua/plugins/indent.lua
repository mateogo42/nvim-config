return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		exclude = {
			buftypes = { "terminal" },
			filetypes = { "dashboard" },
		},

		show_current_context = true,
		show_first_indent_level = false,
		use_treesitter = true,
	},
}
