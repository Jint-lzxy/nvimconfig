local global = require("core.global")
local vim = vim

-- Create cache dir and subs dir
local createdir = function()
	local data_dir = {
		global.cache_dir .. "backup",
		global.cache_dir .. "session",
		global.cache_dir .. "swap",
		global.cache_dir .. "tags",
		global.cache_dir .. "undo",
	}
	-- There only check once that If cache_dir exists
	-- Then I don't want to check subs dir exists
	if vim.fn.isdirectory(global.cache_dir) == 0 then
		os.execute("mkdir -p " .. global.cache_dir)
		for _, v in pairs(data_dir) do
			if vim.fn.isdirectory(v) == 0 then
				os.execute("mkdir -p " .. v)
			end
		end
	end
end

local disable_distribution_plugins = function()
	vim.g.did_load_filetypes = 1
	vim.g.did_load_fzf = 1
	vim.g.did_load_gtags = 1
	vim.g.did_load_gzip = 1
	vim.g.did_load_tar = 1
	vim.g.did_load_tarPlugin = 1
	vim.g.did_load_zip = 1
	vim.g.did_load_zipPlugin = 1
	vim.g.did_load_getscript = 1
	vim.g.did_load_getscriptPlugin = 1
	vim.g.did_load_vimball = 1
	vim.g.did_load_vimballPlugin = 1
	vim.g.did_load_matchit = 1
	vim.g.did_load_matchparen = 1
	vim.g.did_load_2html_plugin = 1
	vim.g.did_load_logiPat = 1
	vim.g.did_load_rrhelper = 1
	vim.g.did_load_netrw = 1
	vim.g.did_load_netrwPlugin = 1
	vim.g.did_load_netrwSettings = 1
	vim.g.did_load_netrwFileHandlers = 1
end

local leader_map = function()
	vim.g.mapleader = " "
	vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
	vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

local neovide_config = function()
	vim.cmd([[set guifont=JetBrainsMono\ Nerd\ Font:h12]])
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_no_idle = true
	vim.g.neovide_cursor_animation_length = 0.03
	vim.g.neovide_cursor_trail_length = 0.05
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_cursor_vfx_opacity = 200.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
	vim.g.neovide_cursor_vfx_particle_speed = 20.0
	vim.g.neovide_cursor_vfx_particle_density = 5.0
end

local dashboard_config = function()
	vim.g.dashboard_footer_icon = "🐬 "
	vim.g.dashboard_default_executive = "telescope"

	vim.g.dashboard_custom_header = {
		[[      ██╗██╗███╗   ██╗████████╗   ██╗     ███████╗██╗  ██╗██╗   ██╗ ]],
		[[      ██║██║████╗  ██║╚══██╔══╝   ██║     ╚══███╔╝╚██╗██╔╝╚██╗ ██╔╝ ]],
		[[      ██║██║██╔██╗ ██║   ██║█████╗██║       ███╔╝  ╚███╔╝  ╚████╔╝  ]],
		[[ ██   ██║██║██║╚██╗██║   ██║╚════╝██║      ███╔╝   ██╔██╗   ╚██╔╝   ]],
		[[ ╚█████╔╝██║██║ ╚████║   ██║      ███████╗███████╗██╔╝ ██╗   ██║    ]],
		[[  ╚════╝ ╚═╝╚═╝  ╚═══╝   ╚═╝      ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ]],
	}
	vim.g.dashboard_custom_section = {
		change_colorscheme = {
			description = { " Scheme change              [leader] s c " },
			command = "DashboardChangeColorscheme",
		},
		find_frecency = {
			description = { " File frecency              [leader] f r " },
			command = "Telescope frecency",
		},
		find_history = {
			description = { " File history               [leader] f e " },
			command = "DashboardFindHistory",
		},
		find_project = {
			description = { " Project find               [leader] f p " },
			command = "Telescope project",
		},
		find_file = {
			description = { " File find                  [leader] f f " },
			command = "DashboardFindFile",
		},
		file_new = {
			description = { " File new                   [leader] f n " },
			command = "DashboardNewFile",
		},
		find_word = {
			description = { " Word find                  [leader] f w " },
			command = "DashboardFindWord",
		},
	}
end

local minimap_config = function()
	vim.g.minimap_auto_start = 0
	vim.g.minimap_block_filetypes = { "aerial", "NvimTree" }
	vim.g.minimap_git_colors = 1
end

local clipboard_config = function()
	vim.cmd([[
    let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }
    ]])
end

local smartim_config = function()
	vim.g.smartim_default = "com.apple.keylayout.US"
	vim.cmd([[packadd smartim]])
end

local better_escape_config = function()
	vim.g.better_escape_shortcut = "jj"
	vim.g.better_escape_interval = 300
end

local clock_config = function()
	vim.cmd([[packadd sran.nvim]])
	vim.cmd([[packadd clock.nvim]])
	--vim.g.clockn_enable = 1
	vim.g.clockn_winblend = 0
	vim.cmd([[au VimEnter * highlight ClockNormal guifg=#a0caf7]])
	vim.g.clockn_to_top = 2
end

local catppuccin_config = function()
	require("catppuccin").setup({
		transparent_background = true,
		term_colors = true,
		styles = {
			comments = "italic",
			functions = "italic,bold",
			keywords = "italic",
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

local load_core = function()
	local pack = require("core.pack")
	createdir()
	disable_distribution_plugins()
	leader_map()

	pack.ensure_plugins()
	neovide_config()
	dashboard_config()
	minimap_config()
	smartim_config()
	better_escape_config()
	clock_config()
	-- clipboard_config()

	require("core.options")
	require("core.mapping")
	require("keymap")
	require("core.event")
	pack.load_compile()

	-- now need to load config here
	catppuccin_config()
	vim.cmd([[colorscheme catppuccin]])
end

load_core()
