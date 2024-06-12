return function()
	require("tabout").setup({
		tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
		backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
		act_as_tab = true, -- shift content if tab out is not possible
		act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
		enable_backwards = true,
		completion = false,
		tabouts = {
			{ open = "'", close = "'" },
			{ open = '"', close = '"' },
			{ open = "`", close = "`" },
			{ open = "(", close = ")" },
			{ open = "[", close = "]" },
			{ open = "{", close = "}" },
		},
		ignore_beginning = true, -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
		exclude = {
			-- tabout will ignore these filetypes
			"alpha",
			"bigfile",
			"checkhealth",
			"dap-repl",
			"diff",
			"help",
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
