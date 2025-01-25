-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/ltex.lua
-- https://github.com/barreiroleo/ltex_extra.nvim/blob/master/README.md
return function(defaults)
	require("ltex_extra").setup({
		init_check = true,
		path = vim.fn.stdpath("config") .. "/spell",
		log_level = "error",
		server_opts = {
			cmd = { "ltex-ls" },
			on_attach = defaults.on_attach,
			capabilities = defaults.capabilities,
			single_file_support = true,
			settings = {
				ltex = {
					enabled = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc" },
					language = "en-US",
				},
			},
		},
	})
end
