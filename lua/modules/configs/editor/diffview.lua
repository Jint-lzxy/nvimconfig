return function()
	require("diffview").setup({
		diff_binaries = false,
		enhanced_diff_hl = false,
		git_cmd = { "git" },
		hg_cmd = { "hg" },
		use_icons = true,
		show_help_hints = true,
		watch_index = true,
	})
end
