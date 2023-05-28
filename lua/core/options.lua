local global = require("core.global")

local function load_options()
	local global_local = {
		-- backupdir = global.cache_dir .. "backup/",
		-- directory = global.cache_dir .. "swap/",
		-- spellfile = global.cache_dir .. "spell/en.uft-8.add",
		-- viewdir = global.cache_dir .. "view/",
		autoread = true,
		autowrite = true,
		backspace = "indent,eol,start",
		backup = false,
		backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
		breakat = [[\ \	;:,!?]],
		clipboard = "unnamedplus",
		cmdheight = 2, -- 0, 1, 2
		cmdwinheight = 5,
		complete = ".,w,b,k",
		completeopt = "menuone,noselect",
		cursorcolumn = false,
		cursorline = true,
		diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience",
		display = "lastline",
		encoding = "utf-8",
		equalalways = false,
		errorbells = true,
		fileformats = "unix,mac,dos",
		foldlevelstart = 99,
		grepformat = "%f:%l:%c:%m",
		grepprg = "rg --hidden --vimgrep --smart-case --",
		helpheight = 12,
		hidden = true,
		history = 2000,
		ignorecase = true,
		inccommand = "nosplit",
		incsearch = true,
		infercase = true,
		jumpoptions = "stack",
		laststatus = 2,
		list = true,
		listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
		magic = true,
		mousescroll = "ver:3,hor:6",
		previewheight = 12,
		pumblend = 3,
		pumheight = 15,
		redrawtime = 1500,
		ruler = true,
		scrolloff = 3,
		sessionoptions = "buffers,curdir,help,tabpages,winsize",
		shada = "!,'500,<50,@100,s10,h",
		shiftround = true,
		shortmess = "aoOTIcF",
		showbreak = "↳  ",
		showcmd = false,
		showmode = false,
		showtabline = 2,
		sidescrolloff = 5,
		smartcase = true,
		smarttab = true,
		splitbelow = true,
		splitkeep = "cursor",
		splitright = true,
		startofline = false,
		swapfile = false,
		switchbuf = "usetab,uselast",
		termguicolors = true,
		timeout = true,
		timeoutlen = 300,
		ttimeout = true,
		ttimeoutlen = 0,
		undodir = global.cache_dir .. "undo/",
		updatetime = 200,
		viewoptions = "folds,cursor,curdir,slash,unix",
		virtualedit = "block",
		visualbell = true,
		whichwrap = "h,l,<,>,[,],~",
		wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
		wildignorecase = true,
		winblend = 3,
		winminwidth = 10,
		winwidth = 30,
		wrapscan = true,
		writebackup = false,
		-- bw local --
		autoindent = true,
		breakindentopt = "shift:2,min:20",
		concealcursor = "niv",
		conceallevel = 0,
		expandtab = true,
		foldenable = true,
		formatoptions = "1jcroql",
		linebreak = true,
		number = true,
		relativenumber = true,
		shiftwidth = 4,
		signcolumn = "yes",
		softtabstop = 4,
		synmaxcol = 2500,
		tabstop = 4,
		textwidth = 80,
		undofile = true,
		wrap = false,
	}

	local function isempty(s)
		return s == nil or s == ""
	end

	-- custom python provider
	local conda_prefix = os.getenv("CONDA_PREFIX")
	if not isempty(conda_prefix) then
		vim.g.python_host_prog = conda_prefix .. "/bin/python"
		vim.g.python3_host_prog = conda_prefix .. "/bin/python"
	else
		vim.g.python_host_prog = "python"
		vim.g.python3_host_prog = "python3"
	end

	for name, value in pairs(global_local) do
		vim.o[name] = value
	end
end

load_options()
