local M = {}

function M.mode()
	local modes = {
		["n"] = "NORMAL",
		["no"] = "NORMAL",
		["v"] = "VISUAL",
		["V"] = "VISUAL",
		[""] = "VISUAL",
		["s"] = "SELECT",
		["S"] = "SELECT",
		[""] = "SELECT",
		["i"] = "INSERT",
		["ic"] = "INSERT",
		["R"] = "REPLACE",
		["Rv"] = "VISUAL",
		["c"] = "COMMAND",
		["r"] = "PROMPT",
		["rm"] = "MOAR",
		["r?"] = "CONFIRM",
		["!"] = "SHELL",
		["t"] = "TERMINAL",
	}
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format("%%#StatusLineMode#%s%%*", modes[current_mode])
end

function M.filename()
	local max_width = 20
	local file = vim.api.nvim_buf_get_name(0)
	local filename = vim.fn.fnamemodify(file, ":p:.")
	if #filename > max_width then
		filename = vim.fn.pathshorten(filename)
	end
	return string.format("%%#StatusLineFile#%s%%*", filename)
end

function M.filetype()
	local filetype = vim.bo.filetype
	local icon, hl, _ = MiniIcons.get("filetype", filetype)
	return string.format("%%#%s#%s %s%%*", hl, icon, filetype)
end

function M.git()
	local head = vim.b.gitsigns_head
	if not head or head == "" then
		return ""
	end
	return string.format("%%#%s#%s %s%%*", "StatusLineGitBranch", "", head)
end

function M.diff()
	local status_dict = vim.b.gitsigns_status_dict
	if not status_dict then
		return ""
	end
	local status = ""
	if status_dict.added and status_dict.added > 0 then
		status = string.format("%s %%#%s# %s%%*", status, "GitSignsAdd", status_dict.added)
	end
	if status_dict.changed and status_dict.changed > 0 then
		status = string.format("%s %%#%s# %s%%*", status, "GitSignsChange", status_dict.changed)
	end
	if status_dict.removed and status_dict.removed > 0 then
		status = string.format("%s %%#%s# %s%%*", status, "GitSignsDelete", status_dict.removed)
	end
	return status
end

function M.lsp()
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	if #clients == 0 then
		return ""
	end

	return string.format("%%#%s#%s%%*", "StatusLineLsp", clients[1].name)
end

function M.diagnostics()
	local config = require("config")
	local diagnostic_count = vim.diagnostic.count(0)

	local diagnostics = ""
	for severity, count in pairs(diagnostic_count) do
		local sign = config.diagnostics.icons[severity]
		local hl = config.diagnostics.icons_hl[severity]
		diagnostics = string.format("%s %%#%s#%s %s%%*", diagnostics, hl, sign, count)
	end

	return diagnostics
end

function M.separator()
	return " "
end

function M.draw()
	local excluded_ft = {
		oil = true,
		mason = true,
		lazy = true,
		checkhealth = true,
		snacks_picker_input = true,
	}
	if excluded_ft[vim.bo.filetype] then
		return ""
	end
	local statusline = {
		"",
		M.mode(),
		M.separator(),
		M.git(),
		M.separator(),
		M.filename(),
		M.diff(),
		"%=",
		M.diagnostics(),
		M.filetype(),
		M.separator(),
		M.lsp(),
		"",
	}
	return table.concat(statusline, " ")
end

vim.o.statusline = "%!v:lua.require'statusline'.draw()"

return M
