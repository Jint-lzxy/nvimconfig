return function()
	local icons = {
		ui = require("modules.utils.icons").get("ui"),
	}

	require("fidget").setup({
		progress = {
			ignore_done_already = false,
			suppress_on_insert = false,
			ignore = { "null-ls" },
			display = {
				render_limit = 5,
				done_ttl = 2,
				done_icon = icons.ui.Accepted,
			},
		},
		notification = {
			override_vim_notify = false,
			window = {
				zindex = 25,
				winblend = 100,
			},
		},
	})
end
