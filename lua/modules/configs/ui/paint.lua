return function()
	require("paint").setup({
		highlights = {
			{
				filter = { filetype = "lua" },
				pattern = "%s*%-%-%-%s*(@%w+)",
				hl = "markdownCode",
			},
			{
				filter = { filetype = "python" },
				pattern = "%s*([_%w]+:)",
				hl = "Constant",
			},
		},
	})
end
