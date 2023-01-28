local tools = {}
local conf = require("modules.tools.config")

tools["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cmd = "Telescope",
	config = conf.telescope,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "debugloop/telescope-undo.nvim" },
		{ "ahmedkhalf/project.nvim", event = "BufReadPost", config = conf.project },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-frecency.nvim", dependencies = {
			{ "kkharji/sqlite.lua" },
		} },
		{ "jvgrootveld/telescope-zoxide" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	},
}
tools["michaelb/sniprun"] = {
	lazy = true,
	build = "bash ./install.sh",
	cmd = { "SnipRun" },
}
tools["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = conf.trouble,
}
tools["dstein64/vim-startuptime"] = { lazy = true, cmd = "StartupTime" }
tools["gelguy/wilder.nvim"] = {
	lazy = true,
	event = "CmdlineEnter",
	config = conf.wilder,
	dependencies = { { "romgrk/fzy-lua-native" } },
}
tools["cdelledonne/vim-cmake"] = {
	lazy = true,
	cmd = {
		"CMakeGenerate",
		"CMakeClean",
		"CMakeBuild",
		"CMakeInstall",
		"CMakeTest",
		"CMakeSwitch",
		"CMakeOpen",
		"CMakeClose",
		"CMakeStop",
	},
	config = conf.vim_cmake,
}
tools["mrjones2014/legendary.nvim"] = {
	lazy = true,
	cmd = "Legendary",
	config = conf.legendary,
	dependencies = {
		{ "kkharji/sqlite.lua" },
		{ "stevearc/dressing.nvim", event = "VeryLazy", config = conf.dressing },
		{ "folke/which-key.nvim", event = "VeryLazy", config = conf.which_key },
	},
}

return tools
