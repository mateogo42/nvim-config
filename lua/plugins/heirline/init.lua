return {
	"rebelot/heirline.nvim",
	dependencies = { "navarasu/onedark.nvim" },
	event = "UiEnter",
	config = function(_, opts)
		local colors = require("onedark.colors")
		local mode = require("plugins.heirline.mode")
		local filename = require("plugins.heirline.filename")
		local git = require("plugins.heirline.git")
		local common = require("plugins.heirline.common")
		local lsp = require("plugins.heirline.lsp")
		local diagnostics = require("plugins.heirline.diagnostics")
		local bufferline = require("plugins.heirline.bufferline")
		opts.opts = { colors = colors }
		opts.statusline = {
			{
				hl = { bg = "bg0" },
				common.border,
				common.space,
				mode,
				common.space,
				common.space,
				filename,
				common.align,
				git,
				common.align,
				lsp,
				common.space,
				diagnostics,
				common.space,
				common.border,
			},
		}
		opts.tabline = { hl = { bg = "bg0" }, bufferline }
		require("heirline").setup(opts)
	end,
}
