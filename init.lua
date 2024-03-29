--    __   _   _____   _____   _   _   _   __     __
--   |  \ | | | ____| |  _  | | | | | | | |  \   /  |
--   | |\\| | |	__|   |	| | | | | | | | | | |\\_//| |
--   | | \  | | |___  | |_| | | \_/ | | | | | \_/ | |
--   |_|  \_| |_____| |_____|  \___/  |_| |_|     |_|
--
--
local vim = vim
vim.g.mapleader = "\\"
-- config
require("config.globals")
-- Load keybindings
require("config.keys")
require("config.autocmd")

-- Check if is the first time
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
    print("Package manager not detected. Downloading Lazy...")
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    print(out)
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    install = { colorscheme = { "onedark" } },
    checker = { enabled = true },
})
