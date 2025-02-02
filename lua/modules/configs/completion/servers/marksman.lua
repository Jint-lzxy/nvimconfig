-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/marksman.lua
return {
	cmd = { "marksman", "server" },
	filetypes = { "markdown", "markdown.mdx" },
	single_file_support = true,
}
