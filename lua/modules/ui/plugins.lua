local ui = {}
local conf = require("modules.ui.config")

ui["shaunsingh/nord.nvim"] = { lazy = true, config = conf.nord }
ui["sainnhe/edge"] = { lazy = true, config = conf.edge }
ui["catppuccin/nvim"] = {
	lazy = false,
	name = "catppuccin",
	config = conf.catppuccin, -- see config.lua for more information
}
ui["zbirenbaum/neodim"] = {
	lazy = true,
	event = "LspAttach",
	config = conf.neodim,
}
ui["rcarriga/nvim-notify"] = {
	lazy = true,
	event = "VeryLazy",
	config = conf.notify,
}
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = conf.lualine,
}
ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "BufWinEnter",
	config = conf.alpha,
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
	config = conf.nvim_tree,
}
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	config = conf.gitsigns,
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.indent_blankline,
}
ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = conf.nvim_bufferline,
}
ui["dstein64/nvim-scrollview"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.scrollview,
}
ui["mbbill/undotree"] = {
	lazy = true,
	cmd = "UndotreeToggle",
}
ui["j-hui/fidget.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.fidget,
}

return ui
