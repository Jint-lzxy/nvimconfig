local lang = {}
local conf = require("modules.lang.config")

lang["fatih/vim-go"] = {
	lazy = true,
	ft = "go",
	build = ":GoInstallBinaries",
	config = conf.lang_go,
}
lang["simrat39/rust-tools.nvim"] = {
	lazy = true,
	ft = "rust",
	config = conf.rust_tools,
	dependencies = { "nvim-lua/plenary.nvim" },
}
-- lang["kristijanhusak/orgmode.nvim"] = {
-- 	lazy = true,
-- 	ft = "org",
-- 	config = conf.lang_org,
-- }
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	ft = "markdown",
	build = "cd app && yarn install",
}
lang["chrisbra/csv.vim"] = { lazy = true, ft = "csv" }
lang["gauteh/vim-cppman"] = {
	lazy = true,
	enabled = false,
	ft = { "c", "cpp" },
	keys = "K", -- only activate this plugin when we're searching for documentation.
}
return lang
