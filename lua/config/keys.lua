local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local opt = {}

map("n", "<C-b>", ":Neotree toggle<CR>", opt)

-- compe
function _G.next_completion()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	else
		return t("<Tab>")
	end
end

function _G.prev_completion()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	else
		return t("<S-Tab>")
	end
end

vim.keymap.set("i", "<C-Space>", "compe#complete()", { expr = true })
vim.keymap.set("i", "<Tab>", "v:lua.next_completion()", { expr = true })
vim.keymap.set("s", "<Tab>", "v:lua.next_completion()", { expr = true })
vim.keymap.set("i", "<S-Tab>", "v:lua.prev_completion()", { expr = true })
vim.keymap.set("s", "<S-Tab>", "v:lua.prev_completion()", { expr = true })

vim.keymap.set("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", {})
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", {})

vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", {})
vim.keymap.set("n", "gD", ":Lspsaga peek_definition<CR>", {})
vim.keymap.set("n", "gr", ":Lspsaga rename<CR>", {})
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", {})
vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", {})
