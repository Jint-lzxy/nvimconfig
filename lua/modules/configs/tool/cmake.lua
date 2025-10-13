return function()
	local global = require("core.global")

	require("cmake-tools").setup({
		cmake_command = "cmake",
		ctest_command = "ctest",
		do_not_add_newline = true,
		cmake_build_directory = function()
			local sep = global.is_windows and "\\" or "/"
			return ("build%s${variant:buildType}"):format(sep)
		end,
		cmake_regenerate_on_save = true,
		cmake_virtual_text_support = true,
		cmake_compile_commands_options = {
			action = "soft_link",
		},
		cmake_notifications = {
			runner = { enabled = false },
			executor = { enabled = false },
		},
		cmake_executor = {
			name = "quickfix",
			opts = {
				show = "always",
				position = "botright",
				size = 10,
			},
		},
		cmake_runner = {
			name = "toggleterm",
			opts = {
				direction = "float",
				close_on_exit = false,
				auto_scroll = true,
				singleton = true,
			},
		},
	})
end
