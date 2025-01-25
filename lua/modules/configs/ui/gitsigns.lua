return function()
	require("gitsigns").setup({
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		auto_attach = true,
		signcolumn = true,
		sign_priority = 6,
		update_debounce = 100,
		word_diff = false,
		current_line_blame = true,
		diff_opts = { internal = true },
		watch_gitdir = { follow_files = true },
		current_line_blame_opts = { delay = 1000, virt_text = true, virtual_text_pos = "eol" },
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
					:with_desc("git: Toggle staging/unstaging of hunk"),
				["v|<leader>gs"] = map_callback(function()
						actions.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					:with_buffer(bufnr)
					:with_noremap()
					:with_desc("git: Toggle staging/unstaging of selected hunk"),
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
						actions.select_hunk()
					end)
					:with_buffer(bufnr)
					:with_noremap(),
			}
			bind.nvim_load_mapping(map)
		end,
	})
end
