return function()
	require("cmake-tools").setup({
		cmake_command = "cmake",
		cmake_build_directory = "build/${variant:buildType}",
		do_not_add_newline = false,
		auto_close_when_success = true,
		cmake_regenerate_on_save = false,
		cmake_soft_link_compile_commands = true,
		cmake_executor = {
			name = "quickfix",
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
