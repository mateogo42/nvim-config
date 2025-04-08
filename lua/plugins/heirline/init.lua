return {
	"rebelot/heirline.nvim",
	dependencies = { "echasnovski/mini.icons", "olimorris/onedarkpro.nvim" },
	event = "UiEnter",
	config = function(_, opts)
		local colors = require("onedarkpro.helpers")
		local mode = require("plugins.heirline.mode")
		local filename = require("plugins.heirline.filename")
		local git = require("plugins.heirline.git")
		local common = require("plugins.heirline.common")
		local lsp = require("plugins.heirline.lsp")
		local diagnostics = require("plugins.heirline.diagnostics")
		local bufferline = require("plugins.heirline.bufferline")
		opts.opts = { colors = colors.get_colors() }
		opts.statusline = {
			{
				hl = { bg = "bg" },
				mode,
				common.space,
				common.space,
				filename,
				common.align,
				git,
				common.align,
				diagnostics,
				common.space,
				lsp,
			},
		}
		opts.tabline = { hl = { bg = "bg" }, bufferline }
		require("heirline").setup(opts)
	end,
}
