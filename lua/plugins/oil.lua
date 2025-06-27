function _G.oil_title()
	local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
	local dir = require("oil").get_current_dir(bufnr)
	if dir then
		return string.format("%%=%%#StatusLineFile#%s%%*%%=", vim.fn.fnamemodify(dir, ":h:t"))
	else
		return "%=" .. vim.api.nvim_buf_get_name(0) .. "%="
	end
end
return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	---@type oil.Config
	opts = {
		default_file_explorer = true,
		prompt_save_on_select_new_entry = false,
		skip_confirm_for_simple_edits = true,
		delete_to_trash = false,
		float = {
			border = "rounded",
			max_width = 50,
			max_height = 25,
			get_win_title = function(winid)
				return ""
			end,
			win_options = {
				number = false,
				relativenumber = false,
				winblend = 0,
				winhl = "Normal:Normal,FloatBorder:Normal",
				winbar = "%!v:lua.oil_title()",
			},
		},
		keymaps = {
			["<Esc>"] = { "actions.close", mode = "n" },
			["q"] = { "actions.close", mode = "n" },
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
