return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	---@type oil.Config
	opts = {
		default_file_explorer = true,
		prompt_save_on_select_new_entry = false,
		skip_confirm_for_simple_edits = true,
		float = {
			border = "rounded",
			max_width = 50,
			max_height = 25,
			get_win_title = function()
				return ""
			end,
			win_options = {
				number = false,
				relativenumber = false,
				winblend = 0,
				winhl = "Normal:Normal,FloatBorder:Normal",
			},
		},
		keymaps = {
			["<Esc>"] = { "actions.close", mode = "n" },
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
