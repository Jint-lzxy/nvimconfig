return function()
	require("better_escape").setup({
		mapping = { "jk", "kj", "jj" },
		timeout = vim.o.timeoutlen,
		clear_empty_lines = true,
	})
end
