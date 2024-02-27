local vim = vim
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

vim.o.statuscolumn = "%C%s "
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
