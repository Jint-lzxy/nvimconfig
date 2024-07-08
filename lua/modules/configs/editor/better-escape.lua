return function()
	local disabled = { j = { k = false, j = false } }

	require("better_escape").setup({
		timeout = vim.o.timeoutlen,
		mappings = {
			i = {
				j = { k = "<Esc>", j = "<Esc>" },
				k = { j = "<Esc>" },
			},
			c = disabled,
			s = disabled,
			v = disabled,
			t = disabled,
		},
	})
end
