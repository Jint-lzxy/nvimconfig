local completion = {}
local conf = require("modules.completion.config")

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = conf.nvim_lsp,
	dependencies = {
		{ "creativenull/efmls-configs-nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim", config = conf.mason_install },
		{ "glepnir/lspsaga.nvim", config = conf.lspsaga },
		{ "ray-x/lsp_signature.nvim", config = conf.lsp_signature },
	},
}
completion["hrsh7th/nvim-cmp"] = {
	lazy = true,
	config = conf.cmp,
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip", config = conf.luasnip, dependencies = "rafamadriz/friendly-snippets" },
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
		{ "windwp/nvim-autopairs", config = conf.autopairs },
		-- { "tzachar/cmp-tabnine", build = "./install.sh", config = conf.tabnine },
	},
}
--[[
completion["zbirenbaum/copilot.lua"] = {
    lazy = true,
	event = "VeryLazy",
	cmd = "Copilot",
	config = conf.copilot,
	dependencies = {
		{
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup({})
			end,
		},
	},
}
--]]

return completion
