return {
	"stevearc/overseer.nvim",
	keys = {
		{ "<leader>oo", "<cmd>OverseerToggle<cr>", desc = "Task list" },
		{ "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
		{ "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
		{ "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
		{ "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Task builder" },
		{ "<leader>ot", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
		{ "<leader>oc", "<cmd>OverseerClearCache<cr>", desc = "Clear cache" },
	},
	---@type overseer.Config
	opts = {
		task_list = {
			direction = "left",
		},
	},
}
