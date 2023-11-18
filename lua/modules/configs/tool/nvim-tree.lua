return function()
	local icons = {
		diagnostics = require("modules.utils.icons").get("diagnostics"),
		documents = require("modules.utils.icons").get("documents"),
		git = require("modules.utils.icons").get("git"),
		ui = require("modules.utils.icons").get("ui"),
	}

	require("nvim-tree").setup({
		auto_reload_on_write = true,
		disable_netrw = false,
		hijack_cursor = true,
		hijack_netrw = true,
		hijack_unnamed_buffer_when_opening = true,
		open_on_tab = false,
		respect_buf_cwd = false,
		prefer_startup_root = false,
		sort_by = "name",
		sync_root_with_cwd = true,
		view = {
			side = "left",
			number = false,
			signcolumn = "yes",
			centralize_selection = false,
			preserve_window_proportions = false,
			float = { enable = false },
		},
		renderer = {
			full_name = false,
			group_empty = true,
			add_trailing = false,
			highlight_git = true,
			symlink_destination = true,
			root_folder_label = ":.:s?.*?/..?",
			highlight_opened_files = "none",
			special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
			indent_markers = {
				enable = true,
				inline_arrows = true,
				icons = {
					corner = "└",
					edge = "│",
					item = "│",
					none = " ",
				},
			},
			icons = {
				webdev_colors = true,
				git_placement = "after",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				padding = " ",
				symlink_arrow = " 󰁔 ",
				glyphs = {
					default = icons.documents.Default, --
					symlink = icons.documents.Symlink, --
					bookmark = icons.ui.Bookmark,
					git = {
						unstaged = icons.git.Mod_alt,
						staged = icons.git.Add, --󰄬
						unmerged = icons.git.Unmerged,
						renamed = icons.git.Rename, --󰁔
						untracked = icons.git.Untracked, -- "󰞋"
						deleted = icons.git.Remove, --
						ignored = icons.git.Ignore, --◌
					},
					folder = {
						arrow_open = icons.ui.ArrowOpen,
						arrow_closed = icons.ui.ArrowClosed,
						-- arrow_open = "",
						-- arrow_closed = "",
						default = icons.ui.Folder,
						open = icons.ui.FolderOpen,
						empty = icons.ui.EmptyFolder,
						empty_open = icons.ui.EmptyFolderOpen,
						symlink = icons.ui.SymlinkFolder,
						symlink_open = icons.ui.FolderOpen,
					},
				},
			},
		},
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		filters = {
			dotfiles = false,
			no_buffer = false,
			git_clean = false,
			git_ignored = true,
			custom = { ".DS_Store" },
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
			},
			open_file = {
				quit_on_open = false,
				resize_window = true,
				window_picker = {
					enable = true,
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame" },
						buftype = { "terminal", "help" },
					},
				},
			},
			remove_file = {
				close_window = true,
			},
		},
		diagnostics = {
			enable = false,
			show_on_dirs = false,
			debounce_delay = 50,
			icons = {
				hint = icons.diagnostics.Hint_alt,
				info = icons.diagnostics.Information_alt,
				warning = icons.diagnostics.Warning_alt,
				error = icons.diagnostics.Error_alt,
			},
		},
		filesystem_watchers = {
			enable = true,
			debounce_delay = 50,
		},
		git = {
			enable = true,
			cygwin_support = false,
			show_on_dirs = true,
		},
		live_filter = {
			prefix = "[FILTER]: ",
			always_show_folders = true,
		},
		trash = {
			cmd = "trash -F",
		},
		ui = {
			confirm = {
				remove = true,
				trash = true,
				default_yes = false,
			},
		},
		log = {
			enable = false,
		},
	})
end
