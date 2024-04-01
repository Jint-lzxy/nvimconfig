return function()
	require("gitsigns").setup({
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = "┃",
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = "┃",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = "_",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			topdelete = {
				hl = "GitSignsDelete",
				text = "‾",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
		watch_gitdir = { interval = 1000, follow_files = true },
		current_line_blame = true,
		current_line_blame_opts = { delay = 1000, virtual_text_pos = "eol" },
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		word_diff = false,
		diff_opts = { internal = true },
		on_attach = function(bufnr)
			local actions = require("gitsigns.actions")
			local bind = require("keymap.bind")
			local map_callback = bind.map_callback

			local map = {
				["n|]g"] = map_callback(function()
						if vim.wo.diff then
							return "]g"
						end
						vim.schedule(function()
							actions.next_hunk()
						end)
						return "<Ignore>"
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_expr()
					:with_desc("git: Goto next hunk"),
				["n|[g"] = map_callback(function()
						if vim.wo.diff then
							return "[g"
						end
						vim.schedule(function()
							actions.prev_hunk()
						end)
						return "<Ignore>"
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_expr()
					:with_desc("git: Goto prev hunk"),
				["n|<leader>gs"] = map_callback(function()
						actions.stage_hunk()
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_desc("git: Stage hunk"),
				["v|<leader>gs"] = map_callback(function()
						actions.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_desc("git: Stage hunk"),
				["n|<leader>gu"] = map_callback(function()
						actions.undo_stage_hunk()
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_desc("git: Undo stage hunk"),
				["n|<leader>gr"] = map_callback(function()
						actions.reset_hunk()
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_desc("git: Reset hunk"),
				["v|<leader>gr"] = map_callback(function()
						actions.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_desc("git: Reset hunk"),
				["n|<leader>gR"] = map_callback(function()
						actions.reset_buffer()
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_desc("git: Reset buffer"),
				["n|<leader>gp"] = map_callback(function()
						actions.preview_hunk()
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_desc("git: Preview hunk"),
				["n|<leader>gb"] = map_callback(function()
						actions.blame_line({ full = true })
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_desc("git: Blame line"),
				-- Text objects
				["ox|ih"] = map_callback(function()
						actions.text_object()
					end)
					:with_buffer(bufnr)
					:with_noremap(),
			}
			bind.nvim_load_mapping(map)
		end,
	})
end
