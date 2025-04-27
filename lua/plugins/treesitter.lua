return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			config = function()
				-- Disable class keymaps in diff mode
				vim.api.nvim_create_autocmd("BufReadPost", {
					callback = function(event)
						if vim.wo.diff then
							for _, key in ipairs({ "[c", "]c", "[C", "]C" }) do
								pcall(vim.keymap.del, "n", key, { buffer = event.buf })
							end
						end
					end,
				})
			end,
		},
		config = function(_, opts)
			local treesitter_config = require("nvim-treesitter.configs")
			treesitter_config.setup(opts)
		end,
		opts = {
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			autopairs = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"css",
				"yaml",
				"fish",
				"bash",
				"lua",
				"rust",
				"python",
				"go",
				"html",
				"dockerfile",
				"gitignore",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-Space>",
					node_incremental = "<C-Space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						-- Assignments
						["a="] = { query = "@assignment.outer" },
						["i="] = { query = "@assignment.inner" },
						["l="] = { query = "@assignment.lhs" },
						["r="] = { query = "@assignment.rhs" },

						-- Parameters
						["aa"] = { query = "@parameter.outer" },
						["ia"] = { query = "@parameter.inner" },

						-- conditionals
						["ai"] = { query = "@conditional.outer" },
						["ii"] = { query = "@conditional.inner" },

						-- loops
						["al"] = { query = "@loop.outer" },
						["il"] = { query = "@loop.inner" },

						-- function calls
						["af"] = { query = "@call.outer" },
						["if"] = { query = "@call.inner" },

						-- function/method definitions
						["am"] = { query = "@function.outer" },
						["im"] = { query = "@function.inner" },

						-- classes
						["ac"] = { query = "@class.outer" },
						["ic"] = { query = "@class.inner" },
					},
				},
				swap = {
					enable = true,
					keymaps = {},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = { query = "@call.outer" },
						["]m"] = { query = "@function.outer" },
						["]c"] = { query = "@class.outer" },
						["]i"] = { query = "@conditional.outer" },
						["]l"] = { query = "@loop.outer" },
					},
					goto_next_end = {
						["]F"] = { query = "@call.outer" },
						["]M"] = { query = "@function.outer" },
						["]C"] = { query = "@class.outer" },
						["]I"] = { query = "@conditional.outer" },
						["]L"] = { query = "@loop.outer" },
					},
					goto_previous_start = {
						["[f"] = { query = "@call.outer" },
						["[m"] = { query = "@function.outer" },
						["[c"] = { query = "@class.outer" },
						["[i"] = { query = "@conditional.outer" },
						["[l"] = { query = "@loop.outer" },
					},
					goto_previous_end = {
						["[F"] = { query = "@call.outer" },
						["[M"] = { query = "@function.outer" },
						["[C"] = { query = "@class.outer" },
						["[I"] = { query = "@conditional.outer" },
						["[L"] = { query = "@loop.outer" },
					},
				},
			},
		},
	},
	{
		"windwp/nvim-ts-autotag",
		lazy = false,
		opts = {},
	},
}
