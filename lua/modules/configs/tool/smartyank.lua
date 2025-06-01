return function()
	require("smartyank").setup({
		-- disabled here since highlight on yank is already enabled
		highlight = { enabled = false },
		clipboard = { enabled = true },
		tmux = { enabled = false },
		osc52 = {
			enabled = true,
			ssh_only = true,
			silent = true,
			-- use tmux escape sequence, only enable if you're using tmux and have issues
			-- escseq = 'tmux',
		},
		-- copy indiscriminately
		validate_yank = false,
	})
end
