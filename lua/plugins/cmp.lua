local lspkind = require("lspkind")

local function has_words_before()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
	},
	opts = function()
		local cmp = require("cmp")
		return {
			mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<CR>"] = cmp.mapping.confirm({
					select = true,
				}),
				["<C-Space>"] = cmp.mapping.complete(),
			},
			snippet = {
				expand = function(args) end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					with_text = true,
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[Lua]",
						path = "[Path]",
					},
				}),
			},
		}
	end,
}
