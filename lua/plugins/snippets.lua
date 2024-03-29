return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		{
			"nvim-cmp",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
			},
			opts = function(_, opts)
				opts.snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				}
				table.insert(opts.sources, { name = "luasnip" })
			end,
		},
	},
	opts = {
		history = true,
		delete_check_events = "TextChanged",
	},
  -- stylua: ignore
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true, silent = true, mode = "i",
    },
    { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
}
