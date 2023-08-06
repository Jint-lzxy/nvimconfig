-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/neocmake.lua
return {
	cmd = { "neocmakelsp", "--stdio" },
	filetypes = { "cmake" },
	single_file_support = true,
}
