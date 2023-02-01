local ui = {}

ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "BufWinEnter",
	config = require("ui.alpha-nvim"),
}
ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline_nvim"),
}
ui["catppuccin/nvim"] = {
	lazy = false,
	name = "catppuccin",
	config = require("ui.catppuccin-nvim"),
}
ui["sainnhe/edge"] = {
	lazy = true,
	config = require("ui.edge"),
}
ui["j-hui/fidget.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.fidget_nvim"),
}
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	config = require("ui.gitsigns_nvim"),
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine_nvim"),
}
ui["zbirenbaum/neodim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.neodim"),
}
ui["shaunsingh/nord.nvim"] = {
	lazy = true,
	config = require("ui.nord"),
}
ui["rcarriga/nvim-notify"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("ui.nvim-notify"),
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
	config = require("ui.nvimtree"),
}
ui["dstein64/nvim-scrollview"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.nvim-scrollview"),
}

return ui
