local M = {}

function M.draw()
	local buffer = vim.api.nvim_buf_get_name(0)
	local filename = vim.fn.fnamemodify(buffer, ":t")
	local hl = "StatuslineFile"
	local modified = ""
	if vim.bo.modified then
		modified = "%#BufferlineModified#%*"
	end

	return string.format("%%=%%#%s#%s%%*%s%%=", hl, filename, modified)
end

vim.o.winbar = "%!v:lua.require'winbar'.draw()"

return M
