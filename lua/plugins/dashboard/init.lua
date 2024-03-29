return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "navarasu/onedark.nvim" },
	event = "VimEnter",
	cmd = "Alpha",
	opts = function()
		local colors = require("onedark.colors")
		vim.api.nvim_set_hl(0, "AlphaNeovimLogoBlue", { fg = colors.blue })
		vim.api.nvim_set_hl(0, "AlphaNeovimLogoGreen", { fg = colors.green })
		vim.api.nvim_set_hl(0, "AlphaNeovimLogoGreenFBlueB", { fg = colors.green, bg = colors.blue, sp = colors.blue })
		local dashboard = require("alpha.themes.dashboard")
		require("alpha.term")
		local logo = {
			[[ ███       ███ ]],
			[[████      ████]],
			[[██████     █████]],
			[[███████    █████]],
			[[████████   █████]],
			[[█████████  █████]],
			[[█████ ████ █████]],
			[[█████  █████████]],
			[[█████   ████████]],
			[[█████    ███████]],
			[[█████     ██████]],
			[[████      ████]],
			[[ ███       ███ ]],
			[[                  ]],
			[[ N  E  O  V  I  M ]],
		}

		dashboard.section.header.val = logo
		dashboard.section.header.opts.hl = {
			{
				{ "AlphaNeovimLogoBlue", 0, 0 },
				{ "AlphaNeovimLogoGreen", 1, 16 },
				{ "AlphaNeovimLogoBlue", 23, 36 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 3 },
				{ "AlphaNeovimLogoGreenFBlueB", 4, 6 },
				{ "AlphaNeovimLogoGreen", 4, 21 },
				{ "AlphaNeovimLogoBlue", 27, 42 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 6 },
				{ "AlphaNeovimLogoGreenFBlueB", 6, 9 },
				{ "AlphaNeovimLogoGreen", 9, 25 },
				{ "AlphaNeovimLogoBlue", 29, 45 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 10 },
				{ "AlphaNeovimLogoGreenFBlueB", 10, 12 },
				{ "AlphaNeovimLogoGreen", 12, 27 },
				{ "AlphaNeovimLogoBlue", 31, 46 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 12 },
				{ "AlphaNeovimLogoGreenFBlueB", 12, 15 },
				{ "AlphaNeovimLogoGreen", 15, 30 },
				{ "AlphaNeovimLogoBlue", 33, 48 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 15 },
				{ "AlphaNeovimLogoGreen", 15, 33 },
				{ "AlphaNeovimLogoBlue", 35, 51 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 15 },
				{ "AlphaNeovimLogoGreen", 16, 34 },
				{ "AlphaNeovimLogoBlue", 35, 51 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 15 },
				{ "AlphaNeovimLogoGreen", 17, 35 },
				{ "AlphaNeovimLogoBlue", 35, 51 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 15 },
				{ "AlphaNeovimLogoGreen", 18, 34 },
				{ "AlphaNeovimLogoGreenFBlueB", 34, 36 },
				{ "AlphaNeovimLogoBlue", 37, 51 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 15 },
				{ "AlphaNeovimLogoGreen", 19, 35 },
				{ "AlphaNeovimLogoGreenFBlueB", 35, 37 },
				{ "AlphaNeovimLogoBlue", 37, 51 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 15 },
				{ "AlphaNeovimLogoGreen", 20, 36 },
				{ "AlphaNeovimLogoGreenFBlueB", 37, 39 },
				{ "AlphaNeovimLogoBlue", 39, 51 },
			},
			{
				{ "AlphaNeovimLogoBlue", 0, 15 },
				{ "AlphaNeovimLogoGreen", 21, 37 },
				{ "AlphaNeovimLogoGreenFBlueB", 37, 39 },
				{ "AlphaNeovimLogoBlue", 39, 51 },
			},
			{
				{ "AlphaNeovimLogoBlue", 1, 15 },
				{ "AlphaNeovimLogoGreen", 20, 35 },
				{ "AlphaNeovimLogoBlue", 37, 48 },
			},
			{},
			{ { "AlphaNeovimLogoGreen", 0, 9 }, { "AlphaNeovimLogoBlue", 9, 18 } },
		}
		local function button(sc, txt, keybind, keybind_opts)
			local leader = "\\"
			local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

			local opts = {
				position = "center",
				shortcut = sc,
				cursor = 3,
				width = 50,
				align_shortcut = "right",
				hl_shortcut = "Keyword",
			}
			if keybind then
				keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
				opts.keymap = { "n", sc_, keybind, keybind_opts }
			end

			local function on_press()
				local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
				vim.api.nvim_feedkeys(key, "t", false)
			end

			return {
				type = "button",
				val = txt,
				on_press = on_press,
				opts = opts,
			}
		end

		dashboard.section.buttons.val = {
			button("e", "  New file", "<cmd>ene <CR>"),
			button("\\ f h", "󰊄  Recently opened files"),
			button("\\ f f", "󰈞  Find file"),
			button("\\ f g", "󰈬  Find word"),
		}

		return dashboard
	end,
	config = function(_, opts)
		require("alpha").setup(opts.config)
	end,
}
