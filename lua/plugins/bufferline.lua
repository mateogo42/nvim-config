local yellow = "#E5C07B"
local red = "#E86671"
local green = "#98C379"

return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
	},
	config = true,
	opts = function()
		local get_hex = require("cokeline.hlgroups").get_hl_attr
		return {
			fill_hl = "Normal",
			default_hl = {
				fg = function(buffer)
					return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
				end,
				bg = function()
					return get_hex("Normal", "bg")
				end,
			},

			sidebar = {
				filetype = "neo-tree",
				components = {
					{
						text = "                NeoTree",
						fg = yellow,
						bg = function()
							return get_hex("NvimTreeNormal", "bg")
						end,
						bold = true,
					},
				},
			},
			components = {
				{
					text = function(buffer)
						return "  " .. buffer.devicon.icon
					end,
					fg = function(buffer)
						return buffer.devicon.color
					end,
				},
				{
					text = " ",
				},
				{
					text = function(buffer)
						return buffer.filename .. " "
					end,
					bold = function(buffer)
						return buffer.is_focused
					end,
				},
				{
					text = function(buffer)
						if buffer.is_modified then
							return "  "
						else
							return "  "
						end
					end,
					on_click = function(_, _, _, _, buffer)
						buffer:delete()
					end,
					fg = function(buffer)
						if buffer.is_modified then
							return green
						else
							return red
						end
					end,
					bold = true,
				},
			},
		}
	end,
}
