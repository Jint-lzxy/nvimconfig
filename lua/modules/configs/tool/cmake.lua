return function()
	vim.g.cmake_default_config = "Debug"
	vim.g.cmake_root_markers = { ".git", ".svn", "src" }
end
