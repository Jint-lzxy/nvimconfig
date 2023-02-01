local tools = {}

tools["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cmd = "Telescope",
	config = require("modules.configs.tools.telescope_nvim"),
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "debugloop/telescope-undo.nvim" },
		{
			"ahmedkhalf/project.nvim",
			event = "BufReadPost",
			config = require("modules.configs.tools.project"),
		},
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
	config = require("modules.configs.tools.snip-run"),
}
tools["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("modules.configs.tools.trouble_nvim"),
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
	config = require("modules.configs.tools.cmake"),
}
tools["dstein64/vim-startuptime"] = { lazy = true, cmd = "StartupTime" }
tools["gelguy/wilder.nvim"] = {
	lazy = true,
	event = "CmdlineEnter",
	config = require("modules.configs.tools.wilder_nvim"),
	dependencies = { { "romgrk/fzy-lua-native" } },
}
tools["mrjones2014/legendary.nvim"] = {
	lazy = true,
	cmd = "Legendary",
	config = require("modules.configs.tools.legendary_nvim"),
	dependencies = {
		{ "kkharji/sqlite.lua" },
		{
			"stevearc/dressing.nvim",
			event = "VeryLazy",
			config = require("modules.configs.tools.dressing_nvim"),
		},
		-- Please don't remove which-key.nvim otherwise you need to set timeoutlen=300 at `lua/core/options.lua`
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			config = require("modules.configs.tools.whichkey"),
		},
	},
}

return tools
