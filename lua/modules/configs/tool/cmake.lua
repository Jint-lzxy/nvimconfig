return function()
	require("cmake-tools").setup({
		cmake_command = "cmake", -- this is used to specify cmake command path
		cmake_build_directory = "build/${variant:buildType}", -- this is used to specify generate directory for cmake, allows macro expansion
		do_not_add_newline = false, -- don't hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command
		auto_close_when_success = true, -- auto-close the quickfix buffer if the execution is successful
		cmake_regenerate_on_save = false, -- do not auto (re)generate when saving CMakeLists.txt
		cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
		cmake_executor = {
			name = "quickfix", -- name of the executor
			opts = {
				quickfix = {
					show = "always",
					position = "bottom",
					size = 10,
				},
			},
		},
		cmake_terminal = {
			name = "terminal",
			opts = {
				name = "CMake Terminal",
				prefix_name = "[CMakeTools]: ",
			},
		},
	})
end
