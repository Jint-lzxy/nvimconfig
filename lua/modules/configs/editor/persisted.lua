return function()
	require("persisted").setup({
		save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
		silent = true,
		autosave = true,
		autoload = false,
		follow_cwd = true,
		use_git_branch = true,
		should_autosave = function()
			if vim.bo.filetype == "alpha" then
				return false
			end
			return true
		end,
		telescope = { reset_prompt_after_deletion = true },
	})
end
