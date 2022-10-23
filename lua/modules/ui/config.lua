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
		[[    Configuration By 冷酔閑吟                       ver ]] .. os.date("%Y.%m") .. [[     ]],
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

		if keybind == nil then
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

function config.catppuccin()
	local function get_modified_palette()
		-- We need to explicitly declare our new color.
		-- (Because colors haven't been set yet when we pass them to the setup function.)

		local cp = require("catppuccin.palettes").get_palette() -- Get the palette.
		cp.none = "NONE" -- Special setting for complete transparent fg/bg.

		if vim.g.catppuccin_flavour == "mocha" then -- We only modify the "mocha" palette.
			cp.rosewater = "#F5E0DC"
			cp.flamingo = "#F2CDCD"
			cp.mauve = "#DDB6F2"
			cp.pink = "#F5C2E7"
			cp.red = "#F28FAD"
			cp.maroon = "#E8A2AF"
			cp.peach = "#F8BD96"
			cp.yellow = "#FAE3B0"
			cp.green = "#ABE9B3"
			cp.blue = "#96CDFB"
			cp.sky = "#89DCEB"
			cp.teal = "#B5E8E0"
			cp.lavender = "#C9CBFF"

			cp.text = "#D9E0EE"
			cp.subtext1 = "#BAC2DE"
			cp.subtext0 = "#A6ADC8"
			cp.overlay2 = "#C3BAC6"
			cp.overlay1 = "#988BA2"
			cp.overlay0 = "#6E6C7E"
			cp.surface2 = "#6E6C7E"
			cp.surface1 = "#575268"
			cp.surface0 = "#302D41"

			cp.base = "#1E1E2E"
			cp.mantle = "#1A1826"
			cp.crust = "#161320"
		end

		return cp
	end

	vim.g.catppuccin_flavour = "mocha" -- Can be one of: latte, frappe, macchiato, mocha
	local cp = get_modified_palette()

	require("catppuccin").setup({
		flavour = vim.g.catppuccin_flavour,
		background = { light = "latte", dark = "mocha" },
		dim_inactive = {
			enabled = false,
			-- Dim inactive splits/windows/buffers.
			-- NOT recommended if you use old palette (a.k.a., mocha).
			shade = "dark",
			percentage = 0.15,
		},
		transparent_background = false,
		term_colors = true,
		compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
		styles = {
			comments = { "italic" },
			properties = { "italic" },
			functions = { "italic", "bold" },
			keywords = { "italic" },
			operators = { "bold" },
			conditionals = { "bold" },
			loops = { "bold" },
			booleans = { "bold", "italic" },
			numbers = {},
			types = {},
			strings = {},
			variables = {},
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			lsp_trouble = true,
			lsp_saga = true,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = true,
			which_key = true,
			indent_blankline = { enabled = true, colored_indent_levels = false },
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			markdown = true,
			lightspeed = false,
			ts_rainbow = true,
			mason = true,
			neotest = false,
			noice = false,
			hop = true,
			illuminate = true,
			cmp = true,
			dap = { enabled = true, enable_ui = true },
			notify = true,
			symbols_outline = false,
			coc_nvim = false,
			leap = false,
			neotree = { enabled = false, show_root = true, transparent_panel = false },
			telekasten = false,
			mini = false,
			aerial = false,
			vimwiki = true,
			beacon = false,
			navic = { enabled = true, custom_bg = "NONE" },
			overseer = false,
			fidget = true,
		},
		color_overrides = {
			mocha = {
				rosewater = "#F5E0DC",
				flamingo = "#F2CDCD",
				mauve = "#DDB6F2",
				pink = "#F5C2E7",
				red = "#F28FAD",
				maroon = "#E8A2AF",
				peach = "#F8BD96",
				yellow = "#FAE3B0",
				green = "#ABE9B3",
				blue = "#96CDFB",
				sky = "#89DCEB",
				teal = "#B5E8E0",
				lavender = "#C9CBFF",

				text = "#D9E0EE",
				subtext1 = "#BAC2DE",
				subtext0 = "#A6ADC8",
				overlay2 = "#C3BAC6",
				overlay1 = "#988BA2",
				overlay0 = "#6E6C7E",
				surface2 = "#6E6C7E",
				surface1 = "#575268",
				surface0 = "#302D41",

				base = "#1E1E2E",
				mantle = "#1A1826",
				crust = "#161320",
			},
		},
		highlight_overrides = {
			mocha = {
				-- ======================MARK==========================
				--      Change the color settings for mocha here!
				-- ====================================================

				-- For base configs.
				NormalFloat = { fg = cp.text, bg = "#2D2E3D" },
				-- FloatBorder = { fg = cp.blue },
				CursorLineNr = { fg = cp.green },
				Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
				IncSearch = { bg = cp.pink, fg = cp.surface1 },

				-- For native lsp configs.
				DiagnosticVirtualTextError = { bg = cp.none },
				DiagnosticVirtualTextWarn = { bg = cp.none },
				DiagnosticVirtualTextInfo = { bg = cp.none },
				DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

				DiagnosticHint = { fg = cp.rosewater },
				LspDiagnosticsDefaultHint = { fg = cp.rosewater },
				LspDiagnosticsHint = { fg = cp.rosewater },
				LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
				LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

				-- For fidget.
				FidgetTask = { bg = cp.none, fg = cp.surface2 },
				FidgetTitle = { fg = cp.blue, style = { "bold" } },

				-- For telescope
				TelescopeBorder = { fg = cp.mantle, bg = cp.mantle },
				TelescopePromptBorder = { fg = cp.surface0, bg = cp.surface0 },
				TelescopePromptNormal = { fg = cp.white, bg = cp.surface0 },
				TelescopePromptPrefix = { fg = cp.flamingo, bg = cp.surface0 },
				TelescopeNormal = { bg = cp.mantle },
				TelescopePreviewTitle = { fg = cp.base, bg = cp.green },
				TelescopePromptTitle = { fg = cp.base, bg = cp.red },
				TelescopeResultsTitle = { fg = cp.mantle, bg = cp.mantle },
				TelescopeSelection = { fg = cp.text, bg = cp.surface0 },
				TelescopeResultsDiffAdd = { fg = cp.green },
				TelescopeResultsDiffChange = { fg = cp.yellow },
				TelescopeResultsDiffDelete = { fg = cp.red },

				-- For nvim-tree
				NvimTreeRootFolder = { fg = cp.pink },

				-- For treesitter.
				["@field"] = { fg = cp.rosewater },
				["@property"] = { fg = cp.yellow },

				["@include"] = { fg = cp.teal },
				["@operator"] = { fg = cp.sky },
				["@keyword.operator"] = { fg = cp.sky },
				["@punctuation.special"] = { fg = cp.maroon },

				-- ["@float"] = { fg = cp.peach },
				-- ["@number"] = { fg = cp.peach },
				-- ["@boolean"] = { fg = cp.peach },

				["@constructor"] = { fg = cp.lavender },
				-- ["@constant"] = { fg = cp.peach },
				-- ["@conditional"] = { fg = cp.mauve },
				-- ["@repeat"] = { fg = cp.mauve },
				["@exception"] = { fg = cp.peach },

				["@constant.builtin"] = { fg = cp.lavender },
				-- ["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
				-- ["@type.builtin"] = { fg = cp.yellow, style = { "italic" } },
				["@variable.builtin"] = { fg = cp.red, style = { "italic" } },

				-- ["@function"] = { fg = cp.blue },
				["@function.macro"] = { fg = cp.red, style = {} },
				["@parameter"] = { fg = cp.rosewater },
				["@keyword.function"] = { fg = cp.maroon },
				["@keyword"] = { fg = cp.red },
				["@keyword.return"] = { fg = cp.pink, style = {} },

				-- ["@text.note"] = { fg = cp.base, bg = cp.blue },
				-- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
				-- ["@text.danger"] = { fg = cp.base, bg = cp.red },
				-- ["@constant.macro"] = { fg = cp.mauve },

				-- ["@label"] = { fg = cp.blue },
				["@method"] = { style = { "italic" } },
				["@namespace"] = { fg = cp.rosewater, style = {} },

				["@punctuation.delimiter"] = { fg = cp.teal },
				["@punctuation.bracket"] = { fg = cp.overlay2 },
				-- ["@string"] = { fg = cp.green },
				-- ["@string.regex"] = { fg = cp.peach },
				-- ["@type"] = { fg = cp.yellow },
				["@variable"] = { fg = cp.text },
				["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
				["@tag"] = { fg = cp.peach },
				["@tag.delimiter"] = { fg = cp.maroon },
				["@text"] = { fg = cp.text },

				-- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
				-- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
				-- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
				-- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
				-- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
				-- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
				-- ["@string.escape"] = { fg = cp.pink },

				-- ["@property.toml"] = { fg = cp.blue },
				-- ["@field.yaml"] = { fg = cp.blue },

				-- ["@label.json"] = { fg = cp.blue },

				["@function.builtin.bash"] = { fg = cp.red, style = { "italic" } },
				["@parameter.bash"] = { fg = cp.yellow, style = { "italic" } },

				["@field.lua"] = { fg = cp.lavender },
				["@constructor.lua"] = { fg = cp.flamingo },

				["@constant.java"] = { fg = cp.teal },

				["@property.typescript"] = { fg = cp.lavender, style = { "italic" } },
				-- ["@constructor.typescript"] = { fg = cp.lavender },

				-- ["@constructor.tsx"] = { fg = cp.lavender },
				-- ["@tag.attribute.tsx"] = { fg = cp.mauve },

				["@type.css"] = { fg = cp.lavender },
				["@property.css"] = { fg = cp.yellow, style = { "italic" } },

				["@property.cpp"] = { fg = cp.text },

				-- ["@symbol"] = { fg = cp.flamingo },
			},
		},
	})
end

function config.notify()
	local notify = require("notify")
	local icons = {
		diagnostics = require("modules.ui.icons").get("diagnostics"),
		ui = require("modules.ui.icons").get("ui"),
	}

	notify.setup({
		---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
		stages = "fade",
		---@usage Function called when a new window is opened, use for changing win settings/config
		on_open = function(win)
			vim.api.nvim_win_set_option(win, "winblend", 0)
			vim.api.nvim_win_set_config(win, { zindex = 70 })
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
		background_colour = "#1E1E2E",
		---@usage minimum width for notification windows
		minimum_width = 50,
		---@usage notifications with level lower than this would be ignored. [ERROR > WARN > INFO > DEBUG > TRACE]
		level = "TRACE",
		---@usage Icons for the different levels
		icons = {
			ERROR = icons.diagnostics.Error,
			WARN = icons.diagnostics.Warning,
			INFO = icons.diagnostics.Information,
			DEBUG = icons.ui.Bug,
			TRACE = icons.ui.Pencil,
		},
	})

	vim.notify = notify
end

function config.lualine()
	local gps = require("nvim-gps")
	local navic = require("nvim-navic")
	local icons = {
		diagnostics = require("modules.ui.icons").get("diagnostics", true),
		misc = require("modules.ui.icons").get("misc"),
		cmp = require("modules.ui.icons").get("cmp"),
	}

	local cp = require("catppuccin.palettes").get_palette()
	cp.maroon = "#EA999D"
	cp.flamingo = "#EEBEBE"

	local global = require("core.global")

	local custom_theme = {
		normal = {
			a = { bg = cp.lavender, fg = cp.mantle, gui = "bold" },
			b = { bg = cp.surface1, fg = cp.lavender },
			c = { bg = cp.mantle, fg = cp.text },

			-- y = { bg = cp.maroon, fg = cp.surface0 },
			-- z = { bg = cp.flamingo, fg = cp.surface0, gui = "bold" },
		},

		insert = {
			a = { bg = cp.green, fg = cp.base, gui = "bold" },
			b = { bg = cp.surface1, fg = cp.teal },

			-- y = { bg = cp.maroon, fg = cp.surface0 },
			-- z = { bg = cp.flamingo, fg = cp.surface0, gui = "bold" },
		},

		command = {
			a = { bg = cp.peach, fg = cp.base, gui = "bold" },
			b = { bg = cp.surface1, fg = cp.peach },

			-- y = { bg = cp.maroon, fg = cp.surface0 },
			-- z = { bg = cp.flamingo, fg = cp.surface0, gui = "bold" },
		},

		visual = {
			a = { bg = cp.flamingo, fg = cp.base, gui = "bold" },
			b = { bg = cp.surface1, fg = cp.flamingo },

			-- y = { bg = cp.maroon, fg = cp.surface0 },
			-- z = { bg = cp.flamingo, fg = cp.surface0, gui = "bold" },
		},

		replace = {
			a = { bg = cp.maroon, fg = cp.base, gui = "bold" },
			b = { bg = cp.surface1, fg = cp.maroon },

			-- y = { bg = cp.maroon, fg = cp.surface0 },
			-- z = { bg = cp.flamingo, fg = cp.surface0, gui = "bold" },
		},

		inactive = {
			a = { bg = cp.mantle, fg = cp.lavender },
			b = { bg = cp.mantle, fg = cp.surface1, gui = "bold" },
			c = { bg = cp.mantle, fg = cp.overlay0 },
		},
	}

	local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
		return function(str)
			local win_width = vim.fn.winwidth(0)
			if hide_width and win_width < hide_width then
				return ""
			elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
				return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
			end
			return str
		end
	end

	local function escape_status()
		local ok, m = pcall(require, "better_escape")
		return ok and m.waiting and icons.misc.EscapeST .. " " or ""
	end

	local function code_context()
		if navic.is_available() and navic.get_location() ~= "" then
			return navic.get_location()
		elseif gps.is_available() then
			return gps.get_location()
		else
			return ""
		end
	end

	local function show_lsp()
		local msg = "No Active LSP"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		local lsp_lists = {}
		if next(clients) == nil then
			return msg -- No server available
		end
		msg = "" -- LSP available
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			local client_name = client.name
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				-- Avoid adding servers that already exists.
				if not lsp_lists[client_name] then
					lsp_lists[client_name] = true
					msg = msg .. client_name .. ", "
				end
			end
		end
		return msg:sub(1, -3) -- Remove last comma.
	end

	local function get_os_icon()
		if global.is_linux then
			return ""
		elseif global.is_mac then
			return ""
		elseif global.is_windows then
			return ""
		else
			return ""
		end
	end

	local function diff_source()
		local gitsigns = vim.b.gitsigns_status_dict
		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end

	local edit_status = {
		function()
			if vim.bo.modified then
				return ""
			elseif not vim.bo.modifiable or vim.bo.readonly then
				return ""
			else
				return ""
			end
		end,
		color = function()
			return {
				fg = vim.bo.modified and cp.green
					or ((not vim.bo.modifiable or vim.bo.readonly) and cp.red or cp.lavender),
				bg = cp.surface0,
			}
		end,
		padding = { left = 1.8, right = 2 },
	}

	local conditions = {
		check_code_context = function()
			return gps.is_available() or navic.is_available()
		end,
	}

	local mini_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	}
	local simple_sections = {
		lualine_a = { { "mode", icon = "" } },
		lualine_b = { "filetype" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	}
	local outline = {
		sections = mini_sections,
		filetypes = { "lspsagaoutline" },
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
			theme = custom_theme,
			disabled_filetypes = {},
			component_separators = "|",
			section_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode", icon = icons.misc.ManUp } },
			lualine_b = {
				{ "branch", icon = icons.cmp.Copilot },
				{
					"diff",
					symbols = { added = "  ", modified = "  ", removed = "  " },
					padding = { right = 1 },
					source = diff_source,
				},
			},
			lualine_c = {
				edit_status,
				{ code_context, cond = conditions.check_code_context },
			},
			lualine_x = {
				{ escape_status, separator = "" },
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = {
						error = icons.diagnostics.Error,
						warn = icons.diagnostics.Warning,
						info = icons.diagnostics.Information,
					},
					separator = "",
				},
				{
					show_lsp,
					icon = " LSP ~",
					color = { fg = cp.lavender },
					separator = "",
					fmt = trunc(145, 5, 120, false),
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
				{ get_os_icon },
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
			outline,
			dapui_scopes,
			dapui_breakpoints,
			dapui_stacks,
			dapui_watches,
		},
	})
end

function config.nvim_gps()
	local icons = {
		ui = require("modules.ui.icons").get("ui", true),
		kind = require("modules.ui.icons").get("kind", true),
	}

	require("nvim-gps").setup({
		icons = {
			["class-name"] = icons.kind.Namespace, -- Classes and class-like objects
			["function-name"] = icons.kind.Function, -- Functions
			["method-name"] = icons.kind.Method, -- Methods (functions inside class-like objects)
		},
		languages = {
			-- You can disable any language individually here
			["c"] = true,
			["cpp"] = true,
			["go"] = true,
			["java"] = true,
			["javascript"] = true,
			["lua"] = true,
			["rust"] = true,
			["python"] = false,
		},
		separator = " " .. icons.ui.Separator,
	})
end

function config.nvim_navic()
	local icons = {
		ui = require("modules.ui.icons").get("ui", true),
		kind = require("modules.ui.icons").get("kind", true),
		type = require("modules.ui.icons").get("type", true),
	}
	vim.g.navic_silence = true

	require("nvim-navic").setup({
		icons = {
			Method = icons.kind.Method,
			Function = icons.kind.Function,
			Constructor = icons.kind.Constructor,
			Field = icons.kind.Field,
			Variable = icons.kind.Variable,
			Class = icons.kind.Class,
			Interface = icons.kind.Interface,
			Module = icons.kind.Module,
			Property = icons.kind.Property,
			Enum = icons.kind.Enum,
			File = icons.kind.File,
			EnumMember = icons.kind.EnumMember,
			Constant = icons.kind.Constant,
			Struct = icons.kind.Struct,
			Event = icons.kind.Event,
			Operator = icons.kind.Operator,
			TypeParameter = icons.kind.TypeParameter,
			Namespace = icons.kind.Namespace,
			Object = icons.type.Object,
			Array = icons.type.Array,
			Boolean = icons.type.Boolean,
			Number = icons.type.Number,
			Null = icons.type.Null,
			Key = icons.kind.Keyword,
			String = icons.type.String,
			Package = icons.kind.Package,
		},
		highlight = true,
		depth_limit = 5,
		separator = " " .. icons.ui.Separator,
		depth_limit_indicator = "..",
	})
end

function config.nvim_tree()
	local icons = {
		diagnostics = require("modules.ui.icons").get("diagnostics"),
		documents = require("modules.ui.icons").get("documents"),
		git = require("modules.ui.icons").get("git"),
		ui = require("modules.ui.icons").get("ui"),
	}

	require("nvim-tree").setup({
		create_in_closed_folder = false,
		respect_buf_cwd = false,
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
		sync_root_with_cwd = true,
		view = {
			adaptive_size = false,
			centralize_selection = false,
			width = 30,
			side = "left",
			preserve_window_proportions = false,
			number = false,
			relativenumber = false,
			signcolumn = "yes",
			hide_root_folder = false,
			float = {
				enable = false,
				open_win_config = {
					relative = "editor",
					border = "rounded",
					width = 30,
					height = 30,
					row = 1,
					col = 1,
				},
			},
		},
		renderer = {
			add_trailing = false,
			group_empty = true,
			highlight_git = false,
			full_name = false,
			highlight_opened_files = "none",
			special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
			symlink_destination = true,
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
			root_folder_modifier = ":e",
			icons = {
				webdev_colors = true,
				git_placement = "before",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				padding = " ",
				symlink_arrow = "  ",
				glyphs = {
					default = icons.documents.Default, --
					symlink = icons.documents.Symlink, --
					bookmark = icons.ui.Bookmark,
					git = {
						unstaged = icons.git.Mod_alt,
						staged = icons.git.Add, --
						unmerged = icons.git.Unmerged,
						renamed = icons.git.Rename, --
						untracked = icons.git.Untracked, -- "ﲉ"
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
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		update_focused_file = {
			enable = true,
			update_root = false,
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
			ignore = true,
			show_on_dirs = true,
			timeout = 400,
		},
		trash = {
			cmd = "trash -F",
			require_confirm = true,
		},
		live_filter = {
			prefix = "[FILTER]: ",
			always_show_folders = true,
		},
		log = {
			enable = false,
			truncate = false,
			types = {
				all = false,
				config = false,
				copy_paste = false,
				dev = false,
				diagnostics = false,
				git = false,
				profile = false,
				watcher = false,
			},
		},
	})
end

function config.nvim_bufferline()
	local icons = { ui = require("modules.ui.icons").get("ui") }

	local opts = {
		options = {
			numbers = nil,
			modified_icon = icons.ui.Modified_alt,
			buffer_close_icon = icons.ui.Close,
			left_trunc_marker = icons.ui.Left,
			right_trunc_marker = icons.ui.Right,
			max_name_length = 14,
			max_prefix_length = 13,
			tab_size = 20,
			show_buffer_close_icons = true,
			show_buffer_icons = true,
			show_tab_indicators = true,
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			separator_style = "slant",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					padding = 1,
				},
				{
					filetype = "undotree",
					text = "Undo Tree",
					text_align = "center",
					highlight = "Directory",
					separator = true,
				},
			},
			diagnostics_indicator = function(count)
				return "(" .. count .. ")"
			end,
		},
		-- Change bufferline's highlights here! See `:h bufferline-highlights` for detailed explanation.
		-- Note: If you use catppuccin then modify the colors below!
		highlights = {},
	}

	if vim.g.colors_name == "catppuccin" then
		local cp = require("catppuccin.palettes").get_palette() -- Get the palette.
		cp.none = "NONE" -- Special setting for complete transparent fg/bg.

		local catppuccin_hl_overwrite = {
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					mocha = {
						-- Hint
						hint = { fg = cp.rosewater },
						hint_visible = { fg = cp.rosewater },
						hint_selected = { fg = cp.rosewater },
						hint_diagnostic = { fg = cp.rosewater },
						hint_diagnostic_visible = { fg = cp.rosewater },
						hint_diagnostic_selected = { fg = cp.rosewater },
					},
				},
			}),
		}

		opts = vim.tbl_deep_extend("force", opts, catppuccin_hl_overwrite)
	end

	require("bufferline").setup(opts)
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
			["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line({full=true})<CR>',
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
end

function config.scrollview()
	require("scrollview").setup({})
end

function config.fidget()
	require("fidget").setup({
		window = { blend = 0 },
	})
end

return config
