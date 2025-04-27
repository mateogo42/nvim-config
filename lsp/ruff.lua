return {
	trace = "messages",
	init_options = {
		settings = {
			fix = true,
			lint = {
				select = { "ALL" },
				ignore = { "D", "DOC", "INP" },
				enable = true,
			},
			logLevel = "debug",
		},
	},
}
