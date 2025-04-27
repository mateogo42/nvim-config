local M = {}

function M.get_icon(filename)
	local icon, hl, _ = MiniIcons.get("file", filename)
	return string.format("%%#%s#%s%%*", hl, icon)
end

---@param buffer vim.fn.getbufinfo.ret.item
function M.format_filename(buffer)
	local curr = vim.api.nvim_get_current_buf()
	local filename = vim.fn.fnamemodify(buffer.name, ":t")
	local hl = "BufferlineInactive"
	if buffer.bufnr == curr then
		hl = "BufferlineActive"
	end

	return string.format("%%#%s#%s%%*", hl, filename)
end

function M.draw()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	buffers = vim.iter(buffers)
		:map(
			---@param b vim.fn.getbufinfo.ret.item
			function(b)
				local icon = M.get_icon(b.name)
				local filename = M.format_filename(b)
				local modified = string.format("%%#BufferlineModified# %s %%*", b.changed == 1 and "" or " ")
				return "   " .. icon .. " " .. filename .. modified
			end
		)
		:totable()
	return table.concat(buffers, " ")
end

vim.o.tabline = "%!v:lua.require'bufferline'.draw()"

vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<s-tab>", "<cmd>bprev<cr>")

return M
