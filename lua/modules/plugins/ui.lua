local ui = {}

ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "BufWinEnter",
	config = require("modules.configs.ui.alpha-nvim"),
}
ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("modules.configs.ui.bufferline_nvim"),
}
ui["catppuccin/nvim"] = {
	lazy = false,
	name = "catppuccin",
	config = require("modules.configs.ui.catppuccin-nvim"),
}
ui["sainnhe/edge"] = {
	lazy = true,
	config = require("modules.configs.ui.edge"),
}
ui["j-hui/fidget.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("modules.configs.ui.fidget_nvim"),
}
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	config = require("modules.configs.ui.gitsigns_nvim"),
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("modules.configs.ui.indent-blankline"),
}
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("modules.configs.ui.lualine_nvim"),
}
ui["zbirenbaum/neodim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("modules.configs.ui.neodim"),
}
ui["shaunsingh/nord.nvim"] = {
	lazy = true,
	config = require("modules.configs.ui.nord"),
}
ui["rcarriga/nvim-notify"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("modules.configs.ui.nvim-notify"),
}
ui["nvim-tree/nvim-tree.lua"] = {
	lazy = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	},
	config = require("modules.configs.ui.nvimtree"),
}
ui["dstein64/nvim-scrollview"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("modules.configs.ui.nvim-scrollview"),
}

return ui
