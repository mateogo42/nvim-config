return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "kyazdani42/nvim-web-devicons" } },
	config = function()
		require("dashboard").setup({
			config = {
				header = {
					"           ▄▄▄██▀▀▀▀██▄▄            ",
					"         ▄████▀▀      ▀▀█▄          ",
					"        ▄███▀            █▄         ",
					"       ██▀▀▀              █▄        ",
					"       ███▀                █        ",
					"      ██▄▄▄▄  ▄▄▄▄▄▄   ▄▄▄ ██       ",
					"      ██▀▀▀▀  █████▄  ▄██▄▄██       ",
					"      ████▀   ▀▄▄█▄▀ █▀▄█▄▀██       ",
					"     ████▀▀          ▀▄    ██       ",
					"     █▄███▀           █    ██       ",
					"     ▀████▀                ██       ",
					"       ▀███▀        ▄▄     █▀       ",
					"         ▀█▄▄▄            ▄█        ",
					"          ▀██▀           █▀         ",
					"            ██▄▄       ▄█▀          ",
					"            ████▀▀██▀▀██▄▄▄         ",
					"          ▄███▀▀      ██▀█▀█▄▄▄▄    ",
					"      ▄███████▄       ▀█▄▀████▄██▄  ",
					"   ▄█▀███████████▄▄▄▄▄█▀▀█▄████▀▄██ ",
					"  ▄████████████   █████ ▄█▀████▀▀██ ",
					"  ███▀▀▀▀██▀▀▀▀▀█▄██  ██▀         █ ",
					" ████▀   ███▀     ██▄███       █▄ █ ",
					" █████   ██         ▄█▀ █▄          ",
					" ██████▄▄██▀▀▀▀▀▀▄▄▄██▄▄▄█▄▄▄       ",
				},
			},
		})
	end,
}
