local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

local js_formatter = {
	function()
		return {
			exe = mason_bin .. "prettier",
			args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
			stdin = true,
		}
	end,
}
local filetype = {
	rust = {
		-- Rustfmt
		function()
			return {
				exe = mason_bin .. "rustfmt",
				args = { "--emit=stdout --edition 2021" },
				stdin = true,
			}
		end,
	},
	lua = {
		-- luafmt
		function()
			return {
				exe = mason_bin .. "stylua",
				args = { "-" },
				stdin = true,
			}
		end,
	},
	python = {
		-- black
		function()
			return {
				exe = mason_bin .. "black",
				args = { "-" },
				stdin = true,
			}
		end,
	},
	go = {
		-- gofmt
		function()
			return {
				exe = "gofmt",
				stdin = true,
			}
		end,
	},
	javascript = js_formatter,
	typescriptreact = js_formatter,
	javascriptreact = js_formatter,
	scss = js_formatter,
	css = js_formatter,
	html = js_formatter,
}

local group = vim.api.nvim_create_augroup("FormatAutogroup", { clear = false })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = group,
	pattern = { "*.py", "*.lua", "*.rs", "*.scss", "*.css", "*.ts[x]", "*.js[x]", "*.html" },
	command = "FormatWrite",
})

return {
	"mhartington/formatter.nvim",
	event = "BufWrite",
	opts = function()
		return {
			logging = true,
			filetype = filetype,
		}
	end,
}
