return function()
	vim.g.go_code_completion_enabled = 0
	vim.g.go_doc_keywordprg_enabled = 0
	vim.g.go_def_mapping_enabled = 0
	vim.g.go_play_browser_command = require("core.settings").external_browser .. " %URL%"
	vim.g.go_version_warning = 0
end
