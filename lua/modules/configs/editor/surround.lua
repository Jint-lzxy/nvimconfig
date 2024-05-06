return function()
	require("mini.surround").setup({
		highlight_duration = 450,
		respect_selection_type = false,
		search_method = "cover_or_nearest",
		silent = true,
		mappings = {
			add = "sa", -- Add surrounding in Normal and Visual modes
			delete = "sd", -- Delete surrounding
			find = "sf", -- Find surrounding (to the right)
			find_left = "sF", -- Find surrounding (to the left)
			highlight = "sh", -- Highlight surrounding
			replace = "sc", -- Replace surrounding
			update_n_lines = "sn", -- Update `n_lines`

			suffix_last = "l", -- Suffix to search with "prev" method
			suffix_next = "n", -- Suffix to search with "next" method
		},
		-- Number of lines within which surrounding is searched
		n_lines = 30,
	})
end
