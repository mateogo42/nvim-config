--    __   _   _____   _____   _   _   _   __     __
--   |  \ | | | ____| |  _  | | | | | | | |  \   /  |
--   | |\\| | |	__|   |	| | | | | | | | | | |\\_//| |
--   | | \  | | |___  | |_| | | \_/ | | | | | \_/ | |
--   |_|  \_| |_____| |_____|  \___/  |_| |_|     |_|
--
--
require("settings")
require("folds")
require("statusline")
require("winbar")

-- Check if is the first time
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
	print("Package manager not detected. Downloading Lazy...")
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable", -- latest stable release
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	print(out)
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	ui = {
		backdrop = 40,
		border = "rounded",
	},
	defaults = {
		lazy = false,
		version = false,
	},
	install = { colorscheme = { "onedark" } },
	checker = { enabled = true },
})
