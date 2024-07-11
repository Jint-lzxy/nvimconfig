-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/sourcekit.lua
return {
	cmd = { "sourcekit-lsp", "--completion-max-results=300" },
	filetypes = { "swift", "objc", "objcpp" },
}
