local lang = {}

lang["kevinhwang91/nvim-bqf"] = {
	lazy = true,
	ft = "qf",
	config = require("lang.bqf"),
	dependencies = {
		{ "junegunn/fzf", build = ":call fzf#install()" },
	},
}
lang["ray-x/go.nvim"] = {
	lazy = true,
	ft = { "go", "gomod", "gosum" },
	build = ":GoInstallBinaries",
	config = require("lang.go"),
	dependencies = { "ray-x/guihua.lua" },
}
lang["mrcjkb/rustaceanvim"] = {
	lazy = true,
	ft = "rust",
	version = "^3",
	init = require("lang.rust"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
lang["Saecki/crates.nvim"] = {
	lazy = true,
	event = "BufReadPost Cargo.toml",
	config = require("lang.crates"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	ft = "markdown",
	build = ":call mkdp#util#install()",
}
lang["barreiroleo/ltex_extra.nvim"] = {
	lazy = true,
	ft = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc" },
}
lang["fladson/vim-kitty"] = {
	lazy = true,
	ft = { "kitty", "kitty-session" },
}
lang["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
}
lang["gauteh/vim-cppman"] = {
	lazy = true,
	enabled = false,
	ft = { "c", "cpp" },
	keys = "K", -- only activate this plugin when we're searching for documentation.
}

return lang
