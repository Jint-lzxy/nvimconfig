local editor = {}

editor["m4xshen/autoclose.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.autoclose"),
}
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.better-escape"),
}
editor["numToStr/Comment.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.comment"),
}
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
	config = require("editor.diffview"),
}
editor["pteroctopus/faster.nvim"] = {
	lazy = false,
	cond = require("core.settings").load_big_files_faster,
	config = require("editor.bigfile"),
}
editor["folke/flash.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.flash"),
}
editor["smoka7/hop.nvim"] = {
	lazy = true,
	version = "*",
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.hop"),
}
editor["echasnovski/mini.align"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.align"),
}
editor["echasnovski/mini.cursorword"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("editor.cursorword"),
}
editor["echasnovski/mini.surround"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.surround"),
}
editor["ojroques/nvim-bufdel"] = {
	lazy = true,
	cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
}
editor["brenoprata10/nvim-highlight-colors"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.highlight-colors"),
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
	init = require("editor.suda"),
}
editor["romainl/vim-cool"] = {
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
}
editor["chaoren/vim-resizewindow"] = {
	lazy = true,
	event = "BufWinEnter",
	init = require("editor.resizewin"),
}
editor["tpope/vim-sleuth"] = {
	lazy = true,
	event = { "BufNewFile", "BufReadPost", "BufFilePost" },
}

----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() > 0 then
			vim.api.nvim_command([[TSUpdate]])
		end
	end,
	event = "BufReadPre",
	config = require("editor.treesitter"),
	dependencies = {
		{ "mfussenegger/nvim-treehopper" },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "andymass/vim-matchup", init = require("editor.matchup") },
		{ "abecodes/tabout.nvim", config = require("editor.tabout") },
		{ "windwp/nvim-ts-autotag", config = require("editor.autotag") },
		{ "nvim-treesitter/nvim-treesitter-context", config = require("editor.ts-context") },
		{ "JoosepAlviste/nvim-ts-context-commentstring", config = require("editor.ts-context-commentstring") },
	},
}

return editor
