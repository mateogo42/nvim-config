local utils = require("heirline.utils")
local icon = require("plugins.heirline.icon")
local common = require("plugins.heirline.common")

local TablineFileName = {
	provider = function(self)
		local filename = self.filename
		filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
		return filename
	end,
	hl = function(self)
		if self.is_active or self.is_visible then
			return { bold = true, fg = "fg" }
		end
		return { fg = "grey" }
	end,
}

local TablineCloseButton = {
	common.space,
	hl = "Normal",
	{
		provider = function(self)
			if vim.api.nvim_get_option_value("modified", { buf = self.bufnr }) then
				return ""
			end
			return ""
		end,
		hl = function(self)
			if vim.api.nvim_get_option_value("modified", { buf = self.bufnr }) then
				return { fg = "green" }
			end
			return { fg = "red" }
		end,
		on_click = {
			callback = function(_, minwid)
				vim.schedule(function()
					vim.api.nvim_buf_delete(minwid, { force = false })
					vim.cmd.redrawtabline()
				end)
			end,
			minwid = function(self)
				return self.bufnr
			end,
			name = "heirline_tabline_close_buffer_callback",
		},
	},
	common.space,
	common.space,
}

local TablineFileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(self.bufnr)
	end,
	hl = "Normal",
	on_click = {
		callback = function(_, minwid, _, button)
			if button == "m" then -- close on mouse middle click
				vim.schedule(function()
					vim.api.nvim_buf_delete(minwid, { force = false })
				end)
			else
				vim.api.nvim_win_set_buf(0, minwid)
			end
		end,
		minwid = function(self)
			return self.bufnr
		end,
		name = "heirline_tabline_buffer_callback",
	},
	common.space,
	icon,
	common.space,
	TablineFileName,
}

-- this is the default function used to retrieve buffers
local get_bufs = function()
	return vim.tbl_filter(function(bufnr)
		return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
	end, vim.api.nvim_list_bufs())
end

local cur_buf_idx = 1

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		vim.schedule(function()
			local cur_buf = vim.api.nvim_get_current_buf()
			local buffers = get_bufs()
			for index, value in ipairs(buffers) do
				if value == cur_buf then
					cur_buf_idx = index
				end
			end
		end)
	end,
})

vim.keymap.set("n", "<Tab>", function()
	local buffers = get_bufs()
	if #buffers > 0 then
		local new_idx = math.fmod(cur_buf_idx, #buffers) + 1
		vim.api.nvim_win_set_buf(0, buffers[new_idx])
		cur_buf_idx = new_idx
	end
end)

vim.keymap.set("n", "<S-Tab>", function()
	local buffers = get_bufs()
	if #buffers > 0 then
		local new_idx = cur_buf_idx - 1
		if new_idx < 1 then
			new_idx = #buffers
		end
		vim.api.nvim_win_set_buf(0, buffers[new_idx])
		cur_buf_idx = new_idx
	end
end)

local BufferLine = utils.make_buflist(
	{ TablineFileNameBlock, TablineCloseButton },
	{ provider = "", hl = { fg = "red" } }, -- left truncation, optional (defaults to "<")
	{ provider = "", hl = { fg = "red" } } -- right trunctation, also optional (defaults to ...... yep, ">")
)

local TabLineOffset = {
	condition = function(self)
		local win = vim.api.nvim_tabpage_list_wins(0)[1]
		local bufnr = vim.api.nvim_win_get_buf(win)
		self.winid = win

		if vim.bo[bufnr].filetype == "neo-tree" then
			self.title = "FILES"
			return true
			-- elseif vim.bo[bufnr].filetype == "TagBar" then
			--     ...
		end
	end,

	provider = function(self)
		local title = self.title
		local width = vim.api.nvim_win_get_width(self.winid)
		local pad = math.ceil((width - #title) / 2)
		return string.rep(" ", pad) .. title .. string.rep(" ", pad)
	end,

	hl = { fg = "yellow", bold = true },
}

return { TabLineOffset, BufferLine, common.align }
