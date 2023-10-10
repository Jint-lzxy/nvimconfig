-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/ltex.lua
-- https://github.com/barreiroleo/ltex_extra.nvim/blob/master/README.md
return function(defaults)
	require("ltex_extra").setup({
		init_check = true,
		path = vim.fn.getcwd() .. "/spell",
		log_level = "error",
		server_opts = {
			on_attach = defaults.on_attach,
			capabilities = defaults.capabilities,
			single_file_support = true,
			cmd = { "ltex-ls" },
			settings = {
				ltex = {
					enabled = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc" },
					language = "en-US",
				},
			},
		},
	})
end
