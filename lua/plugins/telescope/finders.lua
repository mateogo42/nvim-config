local finders = {}
local find_files_opts = require("telescope.themes").get_dropdown({
	border = true,
	width = 0.8,
	prompt_title = "",
	results_title = "",
	preview_title = "",
	previewer = false,
	selection_caret = "▶ ",
	prompt_prefix = "   ",
	borderchars = {
		prompt = { "█", "", " ", "", " ", " ", " ", " " },
		results = { "█", " ", " ", " ", "█", "█", " ", " " },
	},
})

local live_grep_opts = require("telescope.themes").get_dropdown({
	border = true,
	results_height = 10,
	prompt_title = "",
	results_title = "Results",
	preview_title = "Preview",
	selection_caret = "▶ ",
	prompt_prefix = "   ",
	layout_strategy = "horizontal",
	layout_config = { prompt_position = "top", width = 0.8, height = 0.8 },
	borderchars = {
		-- prompt = { "▀", " ", " ", " ", "▀", "▀", " ", " " },
		prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
		results = { " ", " ", " ", " ", " ", " ", " ", " " },
		preview = { " ", " ", " ", " ", " ", " ", " ", " " },
	},
})

finders.find_files = function()
	local opts = vim.deepcopy(find_files_opts)
	require("telescope.builtin").fd(opts)
end

finders.live_grep = function()
	local opts = vim.deepcopy(live_grep_opts)
	require("telescope.builtin").live_grep(opts)
end

finders.buffers = function()
	local opts = vim.deepcopy(live_grep_opts)
	require("telescope.builtin").buffers(opts)
end

return finders
