local editor = {}

editor["rainbowhxch/accelerated-jk.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("modules.configs.editor.acc-jk"),
}
editor["rmagatti/auto-session"] = {
	lazy = true,
	cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
	config = require("modules.configs.editor.au-session"),
}
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("modules.configs.editor.better-escape"),
}
editor["LunarVim/bigfile.nvim"] = {
	lazy = false,
	config = require("modules.configs.editor.bigfile_nvim"),
	cond = require("core.settings").load_big_files_faster,
}
editor["ojroques/nvim-bufdel"] = {
	lazy = true,
	event = "BufReadPost",
}
editor["rhysd/clever-f.vim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("modules.configs.editor.cleverf"),
}
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}
editor["phaazon/hop.nvim"] = {
	lazy = true,
	--Old Config
	--[[cmd = {
		"HopLine",
		"HopLineStart",
		"HopWord",
		"HopPattern",
		"HopChar1",
		"HopChar2",
	},--]]
	branch = "v2",
	event = "BufReadPost",
	config = require("modules.configs.editor.hop_nvim"),
}
editor["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("modules.configs.editor.neoscroll_nvim"),
}
editor["edluffy/specs.nvim"] = {
	lazy = true,
	event = "CursorMoved",
	config = require("modules.configs.editor.specs_nvim"),
}
editor["luukvbaal/stabilize.nvim"] = {
	lazy = true,
	event = "BufReadPost",
}
editor["akinsho/toggleterm.nvim"] = {
	lazy = true,
	event = "UIEnter",
	config = require("modules.configs.editor.toggleterm_nvim"),
}
editor["romainl/vim-cool"] = {
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
}
editor["terrortylor/nvim-comment"] = {
	lazy = true,
	event = { "BufNewFile", "BufReadPre" },
	config = require("modules.configs.editor.nvim-comment"),
}
editor["junegunn/vim-easy-align"] = {
	lazy = true,
	cmd = "EasyAlign",
}
editor["tpope/vim-fugitive"] = {
	lazy = true,
	cmd = { "Git", "G" },
}
editor["RRethy/vim-illuminate"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("modules.configs.editor.vim-illuminate"),
}
editor["brglng/vim-im-select"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("modules.configs.editor.imselect"),
}

----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = ":TSUpdate",
	event = "BufReadPost",
	config = require("modules.configs.editor.treesitter"),
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "p00f/nvim-ts-rainbow" },
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "mfussenegger/nvim-ts-hint-textobject" },
		{ "andymass/vim-matchup", config = require("modules.configs.editor.matchup") },
		{
			"windwp/nvim-ts-autotag",
			config = require("modules.configs.editor.autotag"),
		},
		{
			"NvChad/nvim-colorizer.lua",
			config = require("modules.configs.editor.nvim-colorizer"),
		},
		{
			"abecodes/tabout.nvim",
			config = require("modules.configs.editor.tabout_nvim"),
		},
	},
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
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
	config = require("modules.configs.editor.nvim_dap"),
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = require("modules.configs.editor.nvim_dap.dapui"),
		},
		{ "theHamsta/nvim-dap-virtual-text", config = require("modules.configs.editor.nvim_dap.dap-virtual-text") },
		{ "jbyuki/one-small-step-for-vimkind" },
	},
}

return editor
