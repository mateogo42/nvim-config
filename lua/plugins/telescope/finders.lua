local finders = {}

local function formattedName(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then
		parent = ""
	end
	local _, color = require("mini.icons").get("file", tail)
	local hl = {
		{
			{
				0,
				#tail + 2,
			},
			color,
		},
		{
			{
				#tail + 2,
				#path + 1,
			},
			"Comment",
		},
		{
			{ #path + 1, 1000 },
			"TelescopeTransparent",
		},
	}
	return string.format("%s\t\t%s", tail, parent), hl
end

local find_files_opts = require("telescope.themes").get_dropdown({
	border = true,
	width = 0.8,
	prompt_title = "",
	results_title = "",
	preview_title = "",
	previewer = false,
	selection_caret = "▶ ",
	prompt_prefix = "   ",
	path_display = formattedName,
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
	path_display = formattedName,
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
	local opts = vim.deepcopy(find_files_opts)
	require("telescope.builtin").buffers(opts)
end

finders.lsp_references = function()
	local opts = vim.deepcopy(live_grep_opts)
	require("telescope.builtin").lsp_references(opts)
end

finders.lsp_implementations = function()
	local opts = vim.deepcopy(live_grep_opts)
	require("telescope.builtin").lsp_implementations(opts)
end

finders.grep_string = function()
	local opts = vim.deepcopy(live_grep_opts)
	require("telescope.builtin").grep_string(opts)
end

return finders
