local lang = {}

lang["fatih/vim-go"] = {
	lazy = true,
	ft = "go",
	build = ":GoInstallBinaries",
	config = require("lang.vim-go"),
}
lang["simrat39/rust-tools.nvim"] = {
	lazy = true,
	ft = "rust",
	config = require("lang.rust-tools"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
lang["Saecki/crates.nvim"] = {
	lazy = true,
	event = "BufReadPost Cargo.toml",
	config = require("lang.crates"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
-- lang["kristijanhusak/orgmode.nvim"] = {
-- 	lazy = true,
-- 	ft = "org",
-- 	config = require("lang.orgmode"),
-- }
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	ft = "markdown",
	build = ":call mkdp#util#install()",
}
lang["barreiroleo/ltex_extra.nvim"] = {
	lazy = true,
	ft = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc" },
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
