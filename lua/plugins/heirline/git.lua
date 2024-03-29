local conditions = require("heirline.conditions")
local common = require("plugins.heirline.common")
return {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
	end,
	{ -- git branch name
		provider = function(self)
			return " " .. self.status_dict.head
		end,
		hl = { fg = "purple", bold = true },
	},
	common.space,
	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and (" " .. count)
		end,
		hl = { fg = "green" },
	},
	common.space,
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and (" " .. count)
		end,
		hl = { fg = "red" },
	},
	common.space,
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and (" " .. count)
		end,
		hl = { fg = "orange" },
	},
}
