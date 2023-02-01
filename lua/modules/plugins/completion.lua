local completion = {}

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("modules.configs.completion.lsp"),
	dependencies = {
		{ "creativenull/efmls-configs-nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			config = require("modules.configs.completion.mason_installer"),
		},
		{
			"glepnir/lspsaga.nvim",
			config = require("modules.configs.completion.lsp_saga"),
		},
		{ "ray-x/lsp_signature.nvim" },
	},
}
completion["hrsh7th/nvim-cmp"] = {
	event = "InsertEnter",
	config = require("modules.configs.completion.nvim-cmp"),
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = require("modules.configs.completion.cmp_luasnip"),
		},
		{ "onsails/lspkind.nvim" },
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "andersevenrud/cmp-tmux" },
		{ "hrsh7th/cmp-path" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-buffer" },
		{ "kdheepak/cmp-latex-symbols" },
		{
			"windwp/nvim-autopairs",
			config = require("modules.configs.completion.autopairs"),
		},
		-- { "tzachar/cmp-tabnine", build = "./install.sh", config = conf.tabnine },
	},
}
--[[
completion["zbirenbaum/copilot.lua"] = {
	cmd = "Copilot",
	event = "InsertEnter",
	config = require("modules.configs.completion.copilot_nvim"),
	dependencies = {
		{
			"zbirenbaum/copilot-cmp",
			config = require("modules.configs.completion.copilot-cmp"),
		},
	},
}
--]]

return completion
