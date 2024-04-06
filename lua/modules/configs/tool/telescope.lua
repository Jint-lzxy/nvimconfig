return function()
	local icons = {
		ui = require("modules.utils.icons").get("ui", true),
		ui_nosep = require("modules.utils.icons").get("ui", true),
	}
	local default_actions = require("telescope.actions")
	local lga_actions = require("telescope-live-grep-args.actions")
	local fb_actions = require("telescope._extensions.file_browser.actions")

	require("telescope").setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			initial_mode = "insert",
			prompt_prefix = " " .. icons.ui.Telescope .. " ",
			selection_caret = icons.ui.ChevronRight,
			scroll_strategy = "limit",
			results_title = false,
			layout_strategy = "horizontal",
			path_display = { "absolute" },
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			color_devicons = true,
			file_ignore_patterns = { ".git/", ".cache", "build/", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.85,
				height = 0.92,
				preview_cutoff = 120,
			},
			preview = {
				timeout = 150,
				filesize_limit = 30,
				highlight_limit = 1,
			},
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			file_sorter = require("telescope.sorters").get_fuzzy_file,
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
			buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		},
		extensions = {
			fzf = {
				fuzzy = false,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			frecency = {
				show_scores = true,
				show_unindexed = true,
				ignore_patterns = { "*.git/*", "*/tmp/*" },
			},
			live_grep_args = {
				auto_quoting = true, -- enable/disable auto-quoting
				-- define mappings, e.g.
				mappings = { -- extend mappings
					i = {
						["<C-k>"] = lga_actions.quote_prompt(),
						["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					},
				},
			},
			file_browser = {
				cwd_to_path = true,
				grouped = true,
				prompt_path = false,
				quiet = false,
				dir_icon = icons.ui_nosep.Folder,
				dir_icon_hl = "NvimTreeFolderIcon",
				display_stat = { date = true, size = true, mode = true },
				use_fd = true,
				git_status = true,
				mappings = {
					["i"] = {
						["<C-c>"] = fb_actions.create,
						["<CR>"] = default_actions.select_default,
						["<S-CR>"] = fb_actions.create_from_prompt,
						["<C-S-r>"] = fb_actions.rename,
						["<C-m>"] = fb_actions.move,
						["<C-y>"] = fb_actions.copy,
						["<C-d>"] = fb_actions.remove,
						["<C-o>"] = fb_actions.open,
						["<C-g>"] = fb_actions.goto_parent_dir,
						["<C-e>"] = fb_actions.goto_home_dir,
						["<C-w>"] = fb_actions.goto_cwd,
						["<C-t>"] = fb_actions.change_cwd,
						["<C-f>"] = fb_actions.toggle_browser,
						["<C-h>"] = fb_actions.toggle_hidden,
						["<C-s>"] = fb_actions.toggle_all,
						["<BS>"] = fb_actions.backspace,
					},
					["n"] = {
						["<CR>"] = default_actions.select_default,
						["c"] = fb_actions.create,
						["r"] = fb_actions.rename,
						["m"] = fb_actions.move,
						["y"] = fb_actions.copy,
						["d"] = fb_actions.remove,
						["o"] = fb_actions.open,
						["g"] = fb_actions.goto_parent_dir,
						["e"] = fb_actions.goto_home_dir,
						["w"] = fb_actions.goto_cwd,
						["t"] = fb_actions.change_cwd,
						["f"] = fb_actions.toggle_browser,
						["h"] = fb_actions.toggle_hidden,
						["s"] = fb_actions.toggle_all,
					},
				},
			},
		},
	})

	require("telescope").load_extension("file_browser")
	require("telescope").load_extension("frecency")
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("live_grep_args")
	require("telescope").load_extension("notify")
	require("telescope").load_extension("projects")
	require("telescope").load_extension("persisted")
	require("telescope").load_extension("zoxide")
end
