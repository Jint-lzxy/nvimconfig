return function()
	local ftdetect = {
		name = "ftdetect",
		opts = { defer = true },
		disable = function()
			vim.api.nvim_set_option_value("filetype", "bigfile", { scope = "local" })
		end,
	}

	local cmp = {
		name = "nvim-cmp",
		opts = { defer = true },
		disable = function()
			require("cmp").setup.buffer({ enabled = false })
		end,
	}

	require("bigfile").setup({
		filesize = 2, -- size of the file in MiB
		pattern = { "*" },
		features = {
			"indent_blankline",
			"lsp",
			"syntax",
			"treesitter",
			"vimopts",
			cmp,
			ftdetect,
		},
	})
end
