return function()
	require("treesitter-context").setup({
		enable = true,
		line_numbers = true,
		max_lines = 3,
		min_window_height = 0,
		multiline_threshold = 20,
		trim_scope = "outer",
		mode = "cursor",
		-- Ensure compatibility with Glance's preview window
		zindex = 50,
	})
end
