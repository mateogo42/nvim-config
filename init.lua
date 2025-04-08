--    __   _   _____   _____   _   _   _   __     __
--   |  \ | | | ____| |  _  | | | | | | | |  \   /  |
--   | |\\| | |	__|   |	| | | | | | | | | | |\\_//| |
--   | | \  | | |___  | |_| | | \_/ | | | | | \_/ | |
--   |_|  \_| |_____| |_____|  \___/  |_| |_|     |_|
--
--
vim.g.mapleader = "\\"
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.formatoptions = vim.opt.formatoptions - "o"
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.o.showtabline = 2

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars = [[eob: ,fold: ,foldopen:󰧖,foldsep: ,foldclose:󰧚]]

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
