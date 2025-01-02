return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	opts = {
		default_file_explorer = true,
		prompt_save_on_select_new_entry = false,
		skip_confirm_for_simple_edits = true,
		float = {
			padding = 10,
			border = "none",
			win_options = {
				number = false,
				relativenumber = false,
				winblend = 1,
			},
		},
	},
	keys = {
		{
			"<C-B>",
			function()
				require("oil").toggle_float()
			end,
		},
	},
}
