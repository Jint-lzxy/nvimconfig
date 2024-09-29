return function()
	require("paint").setup({
		highlights = {
			{
				filter = { filetype = "lua" },
				pattern = "%s*%-%-%-%s*(@%w+)",
				hl = "markdownCode",
			},
		},
	})
end
