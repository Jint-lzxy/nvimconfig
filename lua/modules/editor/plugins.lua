local editor = {}
local conf = require("modules.editor.config")

editor["junegunn/vim-easy-align"] = { lazy = true, cmd = "EasyAlign" }
editor["RRethy/vim-illuminate"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.illuminate,
}
editor["terrortylor/nvim-comment"] = {
	lazy = true,
	event = { "BufNewFile", "BufReadPre" },
	config = conf.nvim_comment,
}
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = ":TSUpdate",
	event = "BufReadPost",
	config = conf.nvim_treesitter,
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "p00f/nvim-ts-rainbow" },
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "mfussenegger/nvim-ts-hint-textobject" },
		{ "andymass/vim-matchup", config = conf.matchup },
		{ "windwp/nvim-ts-autotag", config = conf.autotag },
		{ "NvChad/nvim-colorizer.lua", config = conf.nvim_colorizer },
		{ "abecodes/tabout.nvim", config = conf.tabout },
	},
}
editor["rainbowhxch/accelerated-jk.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = conf.accelerated_jk,
}
editor["rhysd/clever-f.vim"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.clever_f,
}
editor["romainl/vim-cool"] = {
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
}
editor["phaazon/hop.nvim"] = {
	lazy = true,
	branch = "v2",
	--Old Config
	--[[cmd = {
		"HopLine",
		"HopLineStart",
		"HopWord",
		"HopPattern",
		"HopChar1",
		"HopChar2",
	},--]]
	event = "BufReadPost",
	config = conf.hop,
}
editor["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.neoscroll,
}
editor["akinsho/toggleterm.nvim"] = {
	lazy = true,
	event = "UIEnter",
	config = conf.toggleterm,
}
editor["rmagatti/auto-session"] = {
	lazy = true,
	cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
	config = conf.auto_session,
}
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.better_escape,
}
editor["mfussenegger/nvim-dap"] = {
	lazy = true,
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
	},
	config = conf.dap,
	dependencies = {
		{ "rcarriga/nvim-dap-ui", config = conf.dapui },
		{ "theHamsta/nvim-dap-virtual-text", config = conf.dap_virtual_text },
		{ "jbyuki/one-small-step-for-vimkind" },
	},
}
editor["tpope/vim-fugitive"] = { lazy = true, cmd = { "Git", "G" } }
editor["ojroques/nvim-bufdel"] = {
	lazy = true,
	event = "BufReadPost",
}
editor["edluffy/specs.nvim"] = {
	lazy = true,
	event = "CursorMoved",
	config = conf.specs,
}
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}
editor["brglng/vim-im-select"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.imselect,
}
editor["luukvbaal/stabilize.nvim"] = {
	lazy = true,
	event = "BufReadPost",
}
editor["LunarVim/bigfile.nvim"] = {
	lazy = false,
	config = conf.bigfile,
	cond = require("core.settings").load_big_files_faster,
}

return editor
