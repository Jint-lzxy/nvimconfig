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
		pattern = { "*" }, -- autocmd pattern
		features = { -- features to disable
		filesize = 2, -- size of the file in MiB
			"indent_blankline",
			"lsp",
			"treesitter",
			"vimopts",
			ftdetect,
			cmp,
		},
	})
end
