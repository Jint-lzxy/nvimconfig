return function()
	require("mini.surround").setup({
		highlight_duration = 450,
		respect_selection_type = false,
		search_method = "cover_or_nearest",
		silent = true,
		mappings = {
			add = "sa",
			delete = "sd",
			find = "sf",
			find_left = "sF",
			highlight = "sh",
			replace = "sc",
			update_n_lines = "sn",

			suffix_last = "l",
			suffix_next = "n",
		},
		-- Number of lines within which surrounding is searched
		n_lines = 30,
	})
end
