return {
	"echasnovski/mini.icons",
	config = function(_, opts)
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()
	end,
	opts = {
		file = {
			["init.lua"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
		},
	},
}
