local tool = {}

tool["Civitasv/cmake-tools.nvim"] = {
	lazy = true,
	cmd = {
		"CMakeRun",
		"CMakeBuild",
		"CMakeClean",
		"CMakeDebug",
		"CMakeInstall",
		"CMakeRunTest",
		"CMakeGenerate",
		"CMakeQuickRun",
		"CMakeSettings",
		"CMakeOpenCache",
		"CMakeSelectCwd",
		"CMakeSelectKit",
		"CMakeLaunchArgs",
		"CMakeOpenRunner",
		"CMakeQuickBuild",
		"CMakeQuickDebug",
		"CMakeQuickStart",
		"CMakeStopRunner",
		"CMakeCloseRunner",
		"CMakeOpenExecutor",
		"CMakeStopExecutor",
		"CMakeCloseExecutor",
		"CMakeRunCurrentFile",
		"CMakeSelectBuildDir",
		"CMakeTargetSettings",
		"CMakeSelectBuildType",
		"CMakeShowTargetFiles",
		"CMakeBuildCurrentFile",
		"CMakeDebugCurrentFile",
		"CMakeSelectBuildPreset",
		"CMakeSelectBuildTarget",
		"CMakeSelectLaunchTarget",
		"CMakeSelectConfigurePreset",
	},
	config = require("tool.cmake"),
}
tool["Bekaboo/dropbar.nvim"] = {
	lazy = false,
	config = require("tool.dropbar"),
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
}
tool["nvim-tree/nvim-tree.lua"] = {
	lazy = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	},
	config = require("tool.nvim-tree"),
}
tool["ibhagwan/smartyank.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("tool.smartyank"),
}
tool["michaelb/sniprun"] = {
	lazy = true,
	build = "bash ./install.sh",
	cmd = { "SnipRun", "SnipReset", "SnipInfo" },
	config = require("tool.sniprun"),
}
tool["akinsho/toggleterm.nvim"] = {
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	config = require("tool.toggleterm"),
}
tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}
tool["tpope/vim-fugitive"] = {
	lazy = true,
	cmd = { "Git", "G" },
}
tool["dstein64/vim-startuptime"] = { lazy = true, cmd = "StartupTime" }
tool["folke/which-key.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("tool.which-key"),
}
tool["gelguy/wilder.nvim"] = {
	lazy = true,
	event = "CmdlineEnter",
	config = require("tool.wilder"),
	dependencies = "romgrk/fzy-lua-native",
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "jvgrootveld/telescope-zoxide" },
		{ "nvim-telescope/telescope-frecency.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"DrKJeff16/project.nvim",
			event = { "CursorHold", "CursorHoldI" },
			config = require("tool.project"),
		},
	},
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
tool["mfussenegger/nvim-dap"] = {
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
	config = require("tool.dap"),
	dependencies = {
		{ "jay-babu/mason-nvim-dap.nvim" },
		{ "LiadOz/nvim-dap-repl-highlights" },
		{ "jbyuki/one-small-step-for-vimkind" },
		{ "theHamsta/nvim-dap-virtual-text", config = require("tool.dap.dap-virtual-text") },
		{
			"rcarriga/nvim-dap-ui",
			dependencies = "nvim-neotest/nvim-nio",
			config = require("tool.dap.dapui"),
		},
	},
}

return tool
