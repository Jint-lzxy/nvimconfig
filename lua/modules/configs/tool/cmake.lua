return function()
	vim.g.cmake_command = "cmake"
	vim.g.cmake_test_command = "ctest"
	vim.g.cmake_default_config = "Debug"
	vim.g.cmake_build_dir_location = "./build/"
	vim.g.cmake_console_size = 15
	vim.g.cmake_console_echo_cmd = 1
	vim.g.cmake_link_compile_commands = 1
	vim.g.cmake_statusline = 0
	vim.g.cmake_restore_state = 1
	vim.g.cmake_reinit_on_dir_changed = 1
	vim.g.cmake_root_markers = { ".git", ".svn", "src" }
end
