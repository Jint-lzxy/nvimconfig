-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/vimls.lua
return {
	cmd = { "vim-language-server", "--stdio" },
	filetypes = { "vim" },
	single_file_support = true,
	init_options = {
		isNeovim = true,
		iskeyword = "@,48-57,_,192-255",
		diagnostic = { enable = true },
	},
}
