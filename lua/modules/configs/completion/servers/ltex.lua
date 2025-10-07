-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/ltex.lua
-- https://github.com/barreiroleo/ltex_extra.nvim/blob/master/README.md
return function(defaults)
	vim.lsp.config("ltex", {
		cmd = { "ltex-ls" },
		capabilities = defaults.capabilities,
		single_file_support = true,
		settings = {
			ltex = {
				enabled = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc" },
				language = "en-US",
			},
		},
		on_attach = function()
			require("ltex_extra").setup({
				init_check = true,
				log_level = "error",
				path = vim.fn.stdpath("config") .. "/spell",
			})

			pcall(defaults.on_attach)
		end,
	})
end
