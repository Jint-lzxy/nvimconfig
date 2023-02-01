return function()
	require("dressing").setup({
		input = {
			enabled = true,
			default_prompt = "Input:",
			insert_only = true,
			start_in_insert = true,
			prefer_width = 45,
		},
		select = {
			enabled = true,
			backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
			trim_prompt = true,
		},
	})
end
