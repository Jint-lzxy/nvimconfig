-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/pylsp.lua
return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	settings = {
		pylsp = {
			plugins = {
				-- Lint
				ruff = {
					enabled = true,
					select = {
						"E", -- pycodestyle
						"F", -- pyflakes
					},
					ignore = { "E501" },
					extendSelect = { "I" },
					severities = {
						F401 = "I",
						E501 = "I",
					},
				},
				flake8 = { enabled = false },
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				mccabe = { enabled = false },

				-- Code refactor
				rope = { enabled = true },

				-- Formatting
				black = { enabled = true },
				pyls_isort = { enabled = false },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
			},
		},
	},
}
