return {
	"nvim-telescope/telescope.nvim",
	event = "UiEnter",
	cmd = "Telescope",
	opts = function()
		return {
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "",
				selection_caret = " ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "descending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						mirror = false,
					},
					vertical = {
						mirror = false,
					},
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = {
					"node_modules",
					"vendor/",
				},
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				winblend = 0,
				border = true,
				color_devicons = true,
				use_less = true,
				path_display = {},
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
			},
		}
	end,
	config = function(test, opts)
		print(vim.inspect(test))
		print(vim.inspect(opts))
		local builtin = require("telescope.builtin")
		local finders = require("plugins.telescope.finders")
		vim.keymap.set("n", "<leader>ff", finders.find_files, {})
		vim.keymap.set("n", "<leader>fg", finders.live_grep, {})
		vim.keymap.set("n", "<leader>fb", finders.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		local colors = require("onedark.colors")
		local TelescopePrompt = {
			TelescopePromptNormal = {
				bg = colors.bg1,
			},
			TelescopePromptBorder = {
				bg = colors.bg1,
				fg = colors.bg1,
			},
			TelescopeResultsBorder = {
				fg = colors.bg1,
				bg = colors.bg0,
			},
			TelescopePreviewBorder = {
				fg = colors.bg1,
				bg = colors.bg0,
			},
			TelescopePreviewTitle = {
				fg = colors.bg0,
				bg = colors.green,
			},
			TelescopeResultsTitle = {
				fg = colors.bg0,
				bg = colors.red,
			},
			TelescopeSelection = {
				bg = colors.bg0,
				fg = colors.green,
			},
			TelescopePromptPrefix = {
				fg = colors.blue,
			},
			TelescopeSelectionCaret = {
				fg = colors.green,
			},
			TelescopeMatching = {
				fg = colors.fg0,
			},
		}
		for hl, col in pairs(TelescopePrompt) do
			vim.api.nvim_set_hl(0, hl, col)
		end
		require("telescope").setup(opts)
	end,
}
