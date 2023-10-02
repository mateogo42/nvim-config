local yellow = "#e5c07b"
local red = "#e86671"

return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"kyazdani42/nvim-web-devicons", -- If you want devicons
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
						text = "             File Explorer",
						fg = yellow,
						bg = get_hex("NvimTreeNormal", "bg"),
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
					text = "  ",
					on_click = function(buffer)
						buffer:delete()
					end,
					fg = red,
					bold = true,
				},
			},
		}
	end,
}
