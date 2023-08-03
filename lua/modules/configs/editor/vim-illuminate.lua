return function()
	require("illuminate").configure({
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
		delay = 100,
		filetypes_denylist = {
			"alpha",
			"dashboard",
			"dirvish",
			"DoomInfo",
			"fugitive",
			"help",
			"lsgsagaoutline",
			"neogitstatus",
			"norg",
			"NvimTree",
			"Outline",
			"TelescopePrompt",
			"toggleterm",
			"Trouble",
			"undotree",
		},
		under_cursor = false,
	})
end
