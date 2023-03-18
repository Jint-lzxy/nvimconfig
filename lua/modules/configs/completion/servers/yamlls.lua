-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/yamlls.lua
return {
	filetypes = { "yaml", "yaml.docker-compose" },
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
			},
		},
		redhat = { telemetry = { enabled = false } },
	},
}
