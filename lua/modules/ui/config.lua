local config = {}

function config.alpha()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
		[[      ██╗██╗███╗   ██╗████████╗   ██╗     ███████╗██╗  ██╗██╗   ██╗ ]],
		[[      ██║██║████╗  ██║╚══██╔══╝   ██║     ╚══███╔╝╚██╗██╔╝╚██╗ ██╔╝ ]],
		[[      ██║██║██╔██╗ ██║   ██║█████╗██║       ███╔╝  ╚███╔╝  ╚████╔╝  ]],
		[[ ██   ██║██║██║╚██╗██║   ██║╚════╝██║      ███╔╝   ██╔██╗   ╚██╔╝   ]],
		[[ ╚█████╔╝██║██║ ╚████║   ██║      ███████╗███████╗██╔╝ ██╗   ██║    ]],
		[[  ╚════╝ ╚═╝╚═╝  ╚═══╝   ╚═╝      ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ]],
		[[                                                                    ]],
		[[    Configuration By 冷酔閑吟                       ver 2022.06     ]],
	}

	local function button(sc, txt, leader_txt, keybind, keybind_opts)
		local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 5,
			width = 50,
			align_shortcut = "right",
			hl = "String",
			hl_shortcut = "Keyword",
		}

		if nil == keybind then
			keybind = sc_after
		end
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_after, keybind, keybind_opts }

		local function on_press()
			-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
			local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "t", false)
		end

		return {
			type = "button",
			val = txt,
			on_press = on_press,
			opts = opts,
		}
	end

	local leader = "<leader>"
	dashboard.section.buttons.val = {
		button("[leader] s c", " Scheme change", leader, "<cmd>Telescope colorscheme<cr>"),
		button("[leader] f r", " File frecency", leader, "<cmd>Telescope frecency<cr>"),
		button("[leader] f e", " File history", leader, "<cmd>Telescope oldfiles<cr>"),
		button("[leader] f p", " Project find", leader, "<cmd>Telescope project<cr>"),
		button("[leader] f f", " File find", leader, "<cmd>Telescope find_files<cr>"),
		button("[leader] f n", " File new", leader, "<cmd>enew<cr>"),
		button("[leader] f w", " Word find", leader, "<cmd>Telescope live_grep<cr>"),
	}
	dashboard.section.buttons.opts.hl = "String"

	local function footer()
		local total_plugins = #vim.tbl_keys(packer_plugins)
		return " 🥰  Have Fun with neovim"
			.. "   v"
			.. vim.version().major
			.. "."
			.. vim.version().minor
			.. "."
			.. vim.version().patch
			.. "   "
			.. total_plugins
			.. " plugins"
	end

	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "Typedef"

	local head_butt_padding = 2
	local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
	local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
	local foot_butt_padding = 1

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.header,
		{ type = "padding", val = head_butt_padding },
		dashboard.section.buttons,
		{ type = "padding", val = foot_butt_padding },
		dashboard.section.footer,
	}
	alpha.setup(dashboard.opts)
end

function config.edge()
	vim.g.edge_style = "aura"
	vim.g.edge_enable_italic = 1
	vim.g.edge_disable_italic_comment = 1
	vim.g.edge_show_eob = 1
	vim.g.edge_better_performance = 1
	vim.g.edge_transparent_background = 1
end

function config.nord()
	vim.g.nord_contrast = true
	vim.g.nord_borders = false
	vim.g.nord_cursorline_transparent = true
	vim.g.nord_disable_background = false
	vim.g.nord_enable_sidebar_background = true
	vim.g.nord_italic = true
end

--[[
====================MARK=======================
Update: Now fixed.
If you've experienced same issue, try:
https://github.com/catppuccin/nvim/issues/84
https://github.com/catppuccin/nvim/issues/95
===============================================
--]]
function config.catppuccin()
	local cp = require("catppuccin.api.colors").get_colors()
	require("catppuccin").remap({
		-- ======================MARK==========================
		--        Change the core default settings here!
		-- ====================================================

		-- ErrorMsg = { fg = cp.red, style = "bold" },
		-- TSField = { fg = cp.teal },
		-- TSProperty = { fg = cp.teal, style = "NONE" },
		-- TSInclude = { fg = cp.mauve, style = "NONE" },
		-- TSOperator = { fg = cp.sky, style = "NONE" },
		-- TSKeywordOperator = { fg = cp.mauve, style = "NONE" },
		-- TSPunctSpecial = { fg = cp.sky, style = "NONE" },
		-- TSFloat = { fg = cp.peach, style = "NONE" },
		TSNumber = { fg = cp.peach, style = "NONE" },
		-- TSBoolean = { fg = cp.peach, style = "NONE" },
		-- TSConstructor = { fg = cp.sapphire },
		-- TSConstant = { fg = cp.peach },
		-- TSConditional = { fg = cp.mauve, style = "NONE" },
		-- TSRepeat = { fg = cp.mauve, style = "NONE" },
		-- TSException = { fg = cp.mauve, style = "NONE" },
		-- TSConstBuiltin = { fg = cp.peach, style = "NONE" },
		-- TSFuncBuiltin = { fg = cp.peach, style = "NONE" },
		TSNamespace = { fg = cp.rosewater, style = "NONE" },
		-- TSType = { fg = cp.yellow, style = "NONE" },
		-- TSTypeBuiltin = { fg = cp.yellow, style = "italic" },
		-- TSVariableBuiltin = { fg = cp.red },
		-- TSFunction = { fg = cp.blue, style = "NONE" },
		-- TSFuncMacro = { fg = cp.teal, style = "NONE" },
		-- TSParameter = { fg = cp.maroon, style = "italic" },
		-- TSKeywordFunction = { fg = cp.mauve, style = "NONE" },
		-- TSKeyword = { fg = cp.mauve, style = "NONE" },
		-- TSKeywordReturn = { fg = cp.mauve, style = "NONE" },
		-- TSNote = { fg = cp.base, bg = cp.blue },
		-- TSWarning = { fg = cp.base, bg = cp.yellow },
		-- TSDanger = { fg = cp.base, bg = cp.red },
		-- TSConstMacro = { fg = cp.mauve },
		TSURI = { fg = cp.rosewater, style = "underline" },
		-- TSError = { fg = cp.red },
		-- TSLabel = { fg = cp.sapphire },
		-- TSMethod = { fg = cp.blue, style = "NONE" },
		-- TSPunctDelimiter = { fg = cp.overlay2 },
		-- TSPunctBracket = { fg = delimeters },
		-- TSPunctBracket = { fg = cp.overlay2 },
		-- TSString = { fg = cp.green, style = "NONE" },
		-- TSStringRegex = { fg = cp.peach, style = "NONE" },
		TSVariable = { fg = cp.white, style = "NONE" },
		-- TSTagAttribute = { fg = cp.teal, style = "italic" },
		-- TSTag = { fg = cp.mauve },
		-- TSTagDelimiter = { fg = cp.sky },
		-- TSText = { fg = cp.text },

		-- bashTSFuncBuiltin = { fg = cp.red, style = "NONE" },
		-- bashTSParameter = { fg = cp.yellow, style = "NONE" },

		-- typescriptTSProperty = { fg = cp.lavender, style = "NONE" },

		-- cssTSProperty = { fg = cp.yellow, style = "NONE" },
		-- cssTSType = { fg = cp.lavender },

		-- jsonTSLabel = { fg = cp.blue }, -- For labels: label: in C and :label: in Lua.

		-- luaTSField = { fg = cp.rosewater },
		-- luaTSConstructor = { fg = cp.lavender }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
		-- luaTSFuncBuiltin = { fg = cp.teal, style = "italic" }, -- For builtin functions: table.insert in Lua.

		-- javaTSField = { fg = cp.red },
		-- javaTSType = { fg = cp.yellow }, -- current Java TS parser doesn't distinguish types properly
		-- javaTSConstant = { fg = cp.teal },

		-- typescriptTSProperty = { fg = cp.lavender, style = "italic" }, -- Same as TSField.

		-- cppTSProperty = { fg = cp.white },

		-- yamlTSField = { fg = cp.blue }, -- For fields.

		DiagnosticError = { bg = cp.none },
		DiagnosticInfo = { bg = cp.none },
		DiagnosticHint = { bg = cp.none },
		DiagnosticWarn = { bg = cp.none },
	})

	require("catppuccin").setup({
		transparent_background = false,
		term_colors = true,
		styles = {
			comments = "italic",
			functions = "italic,bold",
			keywords = "italic",
			numbers = "NONE",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = true,
			lsp_saga = true,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = { enabled = true, show_root = true },
			which_key = true,
			indent_blankline = { enabled = true, colored_indent_levels = false },
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = true,
			markdown = true,
			lightspeed = false,
			ts_rainbow = true,
			hop = true,
		},
	})
end

function config.notify()
	local notify = require("notify")

	notify.setup({
		---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
		stages = "fade",
		---@usage Function called when a new window is opened, use for changing win settings/config
		on_open = function(win)
			vim.api.nvim_win_set_option(win, "winblend", 0)
		end,
		---@usage Function called when a window is closed
		on_close = nil,
		---@usage timeout for notifications in ms, default 5000
		timeout = 3000,
		-- User render fps value
		fps = 120,
		-- Render function for notifications. See notify-render()
		render = "default",
		---@usage highlight behind the window for stages that change opacity
		background_colour = "#282C34",
		---@usage minimum width for notification windows
		minimum_width = 50,
		---@usage Icons for the different levels
		icons = {
			ERROR = "",
			WARN = "",
			INFO = "",
			DEBUG = "",
			TRACE = "✎",
		},
	})

	vim.notify = notify
end

function config.lualine()
	local gps = require("nvim-gps")

	local function gps_content()
		if gps.is_available() then
			return gps.get_location()
		else
			return ""
		end
	end

	local mini_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	}
	local simple_sections = {
		lualine_a = { "mode" },
		lualine_b = { "filetype" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	}
	local aerial = {
		sections = mini_sections,
		filetypes = { "aerial" },
	}
	local dapui_scopes = {
		sections = simple_sections,
		filetypes = { "dapui_scopes" },
	}

	local dapui_breakpoints = {
		sections = simple_sections,
		filetypes = { "dapui_breakpoints" },
	}

	local dapui_stacks = {
		sections = simple_sections,
		filetypes = { "dapui_stacks" },
	}

	local dapui_watches = {
		sections = simple_sections,
		filetypes = { "dapui_watches" },
	}

	local function python_venv()
		local function env_cleanup(venv)
			if string.find(venv, "/") then
				local final_venv = venv
				for w in venv:gmatch("([^/]+)") do
					final_venv = w
				end
				venv = final_venv
			end
			return venv
		end

		if vim.bo.filetype == "python" then
			local venv = os.getenv("CONDA_DEFAULT_ENV")
			if venv then
				return string.format("%s", env_cleanup(venv))
			end
			venv = os.getenv("VIRTUAL_ENV")
			if venv then
				return string.format("%s", env_cleanup(venv))
			end
		end
		return ""
	end

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "catppuccin",
			disabled_filetypes = {},
			component_separators = "|",
			section_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { { "branch" }, { "diff" } },
			lualine_c = {
				{ gps_content, cond = gps.is_available },
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " " },
				},
			},
			lualine_y = {
				{
					"filetype",
					--				Uncomment to remove file typename
					colored = true, --[[icon_only = true--]]
				},
				{ python_venv },
				{ "encoding" },
				{
					"fileformat",
					icons_enabled = true,
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "CR",
					},
				},
			},
			lualine_z = { "progress", "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {
			"quickfix",
			"nvim-tree",
			"toggleterm",
			"fugitive",
			aerial,
			dapui_scopes,
			dapui_breakpoints,
			dapui_stacks,
			dapui_watches,
		},
	})
end

function config.nvim_gps()
	require("nvim-gps").setup({
		icons = {
			["class-name"] = " ", -- Classes and class-like objects
			["function-name"] = " ", -- Functions
			["method-name"] = " ", -- Methods (functions inside class-like objects)
		},
		languages = {
			-- You can disable any language individually here
			["c"] = true,
			["cpp"] = true,
			["go"] = true,
			["java"] = true,
			["javascript"] = true,
			["lua"] = true,
			["python"] = false,
			["rust"] = false,
		},
		separator = " > ",
	})
end

function config.nvim_tree()
	require("nvim-tree").setup({
		respect_buf_cwd = true,
		auto_reload_on_write = true,
		disable_netrw = false,
		hijack_cursor = true,
		hijack_netrw = true,
		hijack_unnamed_buffer_when_opening = false,
		ignore_buffer_on_setup = false,
		open_on_setup = false,
		open_on_setup_file = false,
		open_on_tab = false,
		sort_by = "name",
		update_cwd = true,
		view = {
			width = 30,
			height = 30,
			side = "left",
			preserve_window_proportions = false,
			number = false,
			relativenumber = false,
			signcolumn = "yes",
			hide_root_folder = false,
		},
		renderer = {
			indent_markers = {
				enable = true,
				icons = {
					corner = "└ ",
					edge = "│ ",
					none = "  ",
				},
			},
			root_folder_modifier = ":e",
			icons = {
				padding = " ",
				symlink_arrow = "  ",
				glyphs = {
					["default"] = "", --
					["symlink"] = "",
					["git"] = {
						["unstaged"] = "",
						["staged"] = "", --
						["unmerged"] = "שׂ",
						["renamed"] = "", --
						["untracked"] = "ﲉ",
						["deleted"] = "",
						["ignored"] = "", --◌
					},
					["folder"] = {
						-- ['arrow_open'] = "",
						-- ['arrow_closed'] = "",
						["arrow_open"] = "",
						["arrow_closed"] = "",
						["default"] = "",
						["open"] = "",
						["empty"] = "",
						["empty_open"] = "",
						["symlink"] = "",
						["symlink_open"] = "",
					},
				},
			},
		},
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		ignore_ft_on_setup = {},
		filters = {
			dotfiles = false,
			custom = { ".DS_Store" },
			exclude = {},
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
						filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
						buftype = { "nofile", "terminal", "help" },
					},
				},
			},
		},
	})
end

function config.nvim_bufferline()
	require("bufferline").setup({
		options = {
			number = "none",
			modified_icon = "✥",
			buffer_close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 14,
			max_prefix_length = 13,
			tab_size = 20,
			show_buffer_close_icons = true,
			show_buffer_icons = true,
			show_tab_indicators = true,
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			separator_style = "thin",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					padding = 1,
				},
			},
		},
	})
end

function config.gitsigns()
	require("gitsigns").setup({
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = "│",
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = "│",
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
		keymaps = {
			-- Default keymap options
			noremap = true,
			buffer = true,
			["n ]g"] = {
				expr = true,
				"&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'",
			},
			["n [g"] = {
				expr = true,
				"&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'",
			},
			["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
			["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
			["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
			["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
			["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
			["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
			-- Text objects
			["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
			["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
		},
		watch_gitdir = { interval = 1000, follow_files = true },
		current_line_blame = true,
		current_line_blame_opts = { delay = 1000, virtual_text_pos = "eol" },
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		word_diff = false,
		diff_opts = { internal = true },
	})
end

function config.indent_blankline()
	require("indent_blankline").setup({
		char = "│",
		show_first_indent_level = true,
		filetype_exclude = {
			"startify",
			"dashboard",
			"dotooagenda",
			"log",
			"fugitive",
			"gitcommit",
			"packer",
			"vimwiki",
			"markdown",
			"json",
			"txt",
			"vista",
			"help",
			"todoist",
			"NvimTree",
			"peekaboo",
			"git",
			"TelescopePrompt",
			"undotree",
			"flutterToolsOutline",
			"", -- for all buffers without a file type
		},
		buftype_exclude = { "terminal", "nofile" },
		show_trailing_blankline_indent = false,
		show_current_context = true,
		context_patterns = {
			"class",
			"function",
			"method",
			"block",
			"list_literal",
			"selector",
			"^if",
			"^table",
			"if_statement",
			"while",
			"for",
			"type",
			"var",
			"import",
		},
		space_char_blankline = " ",
	})
	-- because lazy load indent-blankline so need readd this autocmd
	vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end

function config.clock()
	-- vim.g.clockn_enable = 1
	vim.g.clockn_winblend = 0
	vim.cmd([[au VimEnter * highlight ClockNormal guifg=#a0caf7]])
	vim.g.clockn_to_top = 2
end

function config.fidget()
	require("fidget").setup({
		window = { blend = 0 },
	})
end

return config
