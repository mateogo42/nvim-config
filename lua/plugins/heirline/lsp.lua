local conditions = require("heirline.conditions")
local common = require("plugins.heirline.common")
local icon = require("plugins.heirline.icon")
return {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
	condition = conditions.lsp_attached,
	hl = { fg = "cyan", bold = true },
	icon,
	common.space,
	{
		provider = function()
			local server = vim.lsp.get_active_clients({ bufnr = 0 })[1]
			return server.name
		end,
	},
}
