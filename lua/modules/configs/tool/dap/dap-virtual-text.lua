return function()
	require("nvim-dap-virtual-text").setup({
		enabled = true,
		enabled_commands = true,
		highlight_changed_variables = true,
		highlight_new_as_changed = true,
		show_stop_reason = true,
		commented = false,
		only_first_definition = true,
		all_references = false,
		clear_on_continue = false,
		virt_text_pos = "eol",
		-- experimental features:
		all_frames = false,
		virt_lines = false,
	})
end
