return function()
	require("tabout").setup({
		tabkey = "<Tab>",
		backwards_tabkey = "<S-Tab>",
		act_as_tab = true,
		completion = false,
		act_as_shift_tab = false,
		enable_backwards = true,
		ignore_beginning = true,
		tabouts = {
			{ open = "'", close = "'" },
			{ open = '"', close = '"' },
			{ open = "`", close = "`" },
			{ open = "(", close = ")" },
			{ open = "[", close = "]" },
			{ open = "{", close = "}" },
		},
		exclude = {
			"", -- for all buffers without a file type
			"alpha",
			"checkhealth",
			"dap-repl",
			"diff",
			"help",
			"kitty",
			"notify",
			"NvimTree",
			"Outline",
			"qf",
			"TelescopePrompt",
			"text",
			"toggleterm",
			"undotree",
		},
	})
end
