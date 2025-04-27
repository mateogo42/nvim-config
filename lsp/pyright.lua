return {
	capabilities = {
		textDocument = {
			publishDiagnostics = {
				tagSupport = {
					valueSet = { 2 },
				},
			},
		},
	},
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				diagnosticSeverityOverrides = {
					reportUnusedVariable = "warning",
				},
				ignore = { "*" },
				typeCheckingMode = "off",
			},
		},
	},
}
