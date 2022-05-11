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
	-- vim.g.dashboard_footer_icon = "🐬 "
	vim.g.total_plugins = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
		+ vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/opt", "*", 0, 1))
	vim.g.dashboard_custom_footer = { "🥰  Neovim loaded " .. vim.g.total_plugins .. " plugins" }
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

local check_conda = function()
	local venv = os.getenv("CONDA_PREFIX")
	if venv then
		vim.g.python3_host_prog = venv .. "/bin/python"
	end
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

local load_core = function()
	local pack = require("core.pack")
	createdir()
	disable_distribution_plugins()
	leader_map()

	pack.ensure_plugins()
	neovide_config()
	dashboard_config()
	minimap_config()
	check_conda()
	-- clipboard_config()

	require("core.options")
	require("core.mapping")
	require("keymap")
	require("core.event")
	pack.load_compile()

	vim.cmd([[colorscheme catppuccin]])
end

load_core()
