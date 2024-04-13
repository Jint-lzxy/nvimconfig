return function()
	require("paint").setup({
		---type PaintHighlight[]
		highlights = {
			{
				-- filter can be a table of buffer options that should match,
				-- or a function called with buf as param that should return true.
				-- The example below will paint @something in comments with markdownCode
				filter = { filetype = "lua" },
				pattern = "%s*%-%-%-%s*(@%w+)",
				hl = "markdownCode",
			},
			{
				filter = { filetype = "python" },
				pattern = "%s*([_%w]+:)",
				hl = "markdownCode",
			},
		},
	})
end
