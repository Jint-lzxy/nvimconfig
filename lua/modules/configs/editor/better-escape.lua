return function()
	require("better_escape").setup({
		timeout = vim.o.timeoutlen,
		default_mappings = false,
		mappings = {
			i = {
				k = { j = "<Esc>" },
				j = { k = "<Esc>", j = "<Esc>" },
			},
		},
	})
end
