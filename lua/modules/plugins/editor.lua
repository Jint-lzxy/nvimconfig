local editor = {}

editor["rainbowhxch/accelerated-jk.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("editor.accelerated-jk"),
}
editor["m4xshen/autoclose.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.autoclose"),
}
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.better-escape"),
}
editor["LunarVim/bigfile.nvim"] = {
	lazy = false,
	config = require("editor.bigfile"),
	cond = require("core.settings").load_big_files_faster,
}
editor["numToStr/Comment.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.comment_nvim"),
}
editor["rhysd/clever-f.vim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("editor.cleverf"),
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
	config = require("editor.hop"),
}
editor["ojroques/nvim-bufdel"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
}
editor["olimorris/persisted.nvim"] = {
	lazy = true,
	cmd = {
		"SessionToggle",
		"SessionStart",
		"SessionStop",
		"SessionSave",
		"SessionLoad",
		"SessionLoadLast",
		"SessionLoadFromFile",
		"SessionDelete",
	},
	config = require("editor.persisted"),
}
editor["lambdalisue/suda.vim"] = {
	lazy = true,
	cmd = { "SudaRead", "SudaWrite" },
	config = require("editor.suda"),
}
editor["romainl/vim-cool"] = {
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
}
editor["junegunn/vim-easy-align"] = {
	lazy = true,
	cmd = "EasyAlign",
}
editor["RRethy/vim-illuminate"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.vim-illuminate"),
}

----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command([[TSUpdate]])
		end
	end,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.treesitter"),
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "mrjones2014/nvim-ts-rainbow" },
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "mfussenegger/nvim-treehopper" },
		{ "andymass/vim-matchup", config = require("editor.matchup") },
		{ "nvim-treesitter/nvim-treesitter-context", config = require("editor.ts-context") },
		{ "windwp/nvim-ts-autotag", config = require("editor.autotag") },
		{ "NvChad/nvim-colorizer.lua", config = require("editor.colorizer") },
		{ "abecodes/tabout.nvim", config = require("editor.tabout") },
	},
}

return editor
