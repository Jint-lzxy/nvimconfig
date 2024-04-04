-- TODO: add expls for `s` and `gc`
return function()
	local icons = {
		ui = require("modules.utils.icons").get("ui"),
		misc = require("modules.utils.icons").get("misc"),
	}

	require("which-key").setup({
		plugins = {
			presets = {
				operators = false,
				motions = false,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		icons = {
			breadcrumb = icons.ui.Separator,
			separator = icons.misc.Vbar,
			group = "",
		},
		window = {
			border = "none",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 1, 1, 1, 1 },
			winblend = 0,
		},
	})

	require("which-key").register({
		-- <leader> stuffs
		["<leader>"] = {
			b = {
				name = "󰓩 Buffers",
				d = "buffer: Sort by directory",
				e = "buffer: Sort by extension",
			},
			c = { { mode = "n", "edit: Toggle spell check" } },
			d = {
				name = " Debug",
				b = "debug: Set breakpoint with condition",
				B = "debug: List breakpoints",
				c = "debug: Run to cursor",
				d = "debug: Close debug panels",
				i = "debug: Step into",
				l = "debug: Do last run again",
				o = "debug: Step out",
				O = "debug: Open repl",
				r = "debug: Run/Continue",
				R = "debug: Start Lua debugger",
				t = "debug: Terminate debug session",
				v = "debug: Step over",
			},
			f = {
				name = " Telescope / Fuzzy Find",
				a = "find: Nvim automatic commands",
				b = "find: Buffer opened",
				c = "ui: Change colorscheme",
				d = "find: Session",
				e = "find: File by history",
				f = "find: File under cwd",
				g = "find: File under current git directory",
				h = "find: Nvim highlights",
				i = "find: Open filetree browser",
				k = "find: Keymaps",
				n = "edit: New file",
				o = "find: Nvim options",
				p = "find: Project",
				r = "find: File by frecency",
				R = "find: Open previous picker",
				s = "find: Word under cursor",
				t = "find: Todo comments",
				w = "find: Word",
				z = "edit: Change cwd using zoxide",
			},
			g = {
				name = "󰊢 Git",
				d = "git: Show diff",
				D = "git: Close diff",
				g = "git: Toggle lazygit",
				G = "git: Toggle fugitive",
			},
			j = "jump: Goto line",
			k = "jump: Goto line",
			l = {
				name = "󱜙 LSP",
				d = "lsp: Show document diagnostics",
				i = "lsp: Info",
				l = "lsp: Show lsp references",
				L = "lsp: Show loclist",
				q = "lsp: Show quickfix list",
				r = "lsp: Restart",
				s = "lsp: Stop",
				S = "lsp: Start",
				w = "lsp: Show workspace diagnostics",
				x = "lsp: Show line disgnostics",
			},
			n = {
				name = " File Tree",
				f = "filetree: NvimTree find file",
				r = "filetree: NvimTree refresh",
			},
			o = "jump: Goto one char",
			O = "jump: Goto two chars",
			p = {
				{ mode = "x", "edit: Replacement using blackhole reg" },

				name = " Package",
				c = "package: Check",
				d = "package: Debug",
				h = "package: Show",
				i = "package: Install",
				l = "package: Log",
				p = "package: Profile",
				r = "package: Restore",
				s = "package: Sync",
				u = "package: Update",
				x = "package: Clean",
			},
			r = {
				name = " SnipRun",
				{ mode = "n", "tool: Execute current line" },
				{ mode = "v", "tool: Execute current selection" },
			},
			s = {
				name = " Sessions",
				s = "sesson: Save current",
				l = "sesson: Load current",
				d = "sesson: Delete current",
			},
			t = {
				name = " Tab Pages",
				c = "tab: Close current tab",
				j = "tab: Move to previous tab",
				k = "tab: Move to next tab",
				n = "tab: Create a new tab",
				o = "tab: Only keep current tab",
			},
			u = "edit: Show undo history",
			w = "jump: Goto word",
		},
		g = {
			name = "󰢩 Miscellaneous / Utils",
			a = { mode = { "n", "v" }, "lsp: Code action" },
			b = "buffer: Pick current buffer",
			c = {
				name = "󱜙 LSP Call Hierarchy",
				i = "lsp: Show incoming calls",
				o = "lsp: Show outgoing calls",
			},
			d = "lsp: Preview definition(s)",
			D = "lsp: Goto definition",
			e = {
				name = "󰝔 Alignments",
				a = "edit: Align with delimiter",
			},
			h = "lsp: Show reference(s)",
			m = "lsp: Show implementation(s)",
			o = "lsp: Toggle outline",
			p = {
				name = "󰊢 Git",
				s = "git: Push",
				l = "git: Pull",
			},
			r = "lsp: Rename in file range",
			R = "lsp: Rename in project range",
			s = "lsp: Signature help",
			t = "lsp: Preview type definition(s)",
			["["] = "lsp: Prev diagnostic",
			["]"] = "lsp: Next diagnostic",
		},

		-- Core mappings
		["<S-Tab>"] = "edit: Toggle code fold",
		["<C-s>"] = "edit: Save file",
		m = { { mode = "o", "jump: Operate across syntax tree" } },
		Y = "edit: Yank text to EOL",
		D = "edit: Delete text to EOL",
		n = "edit: Next search result",
		N = "edit: Prev search result",
		J = {
			{ mode = "n", "edit: Join next line" },
			{ mode = "v", "edit: Move this line down" },
		},
		K = {
			{ mode = "n", "lsp: Show doc" },
			{ mode = "v", "edit: Move this line up" },
		},
		["<A-o>"] = "window: Close current split",
		["<C-h>"] = {
			{ mode = "n", "window: Focus shift left" },
			{ mode = "c", "edit: Delete one char" },
			{ mode = "t", "window: Focus shift left" },
		},
		["<C-l>"] = "window: Focus shift right",
		["<C-j>"] = "window: Focus shift down",
		["<C-k>"] = {
			{ mode = "n", "window: Focus shift up" },
			{ mode = "t", "window: Focus shift up" },
		},
		["<A-[>"] = "window: Resize -5 vertically",
		["<A-]>"] = "window: Resize +5 vertically",
		["<A-;>"] = "window: Resize -2 horizontally",
		["<A-'>"] = "window: Resize +2 horizontally",
		["<Up>"] = "window: Resize +1 horizontally",
		["<Down>"] = "window: Resize -1 horizontally",
		["<Left>"] = "window: Resize +2 vertically",
		["<Right>"] = "window: Resize -2 vertically",
		["<C-q>"] = { mode = { "n", "i" }, "edit: Save file and quit" },
		["<A-S-q>"] = "edit: Force quit without writing",
		["+"] = "edit: Increment under cursor",
		["-"] = "edit: Decrement under cursor",
		["<C-a>"] = {
			{ mode = { "n", "x" }, "edit: Select all" },
			{ mode = "c", "edit: Far left" },
			{ mode = "i", "edit: Move cursor to line start" },
		},
		["<C-u>"] = { mode = "i", "edit: Delete previous block" },
		["<C-b>"] = { mode = { "c", "i" }, "edit: Move cursor one char left" },
		["<C-f>"] = { mode = "c", "edit: Right" },
		["<C-e>"] = { mode = "c", "edit: Far right" },
		["<C-d>"] = { mode = "c", "edit: Delete one char" },
		["<C-t>"] = { mode = "c", "edit: Complete path of parent folder" },
		["<"] = { mode = "v", "edit: Decrease indent (1L)" },
		[">"] = { mode = "v", "edit: Increase indent (1L)" },

		-- UI/UX
		["<A-q>"] = {
			{ mode = "n", "buffer: Close" },
			{ mode = "t", "terminal: Back to normal mode" },
		},
		["<A-p>"] = "buffer: Pin current buffer",
		["<A-k>"] = "buffer: Cycle Next",
		["<A-j>"] = "buffer: Cycle Prev",
		["<A-S-k>"] = "buffer: Move current to next",
		["<A-S-j>"] = "buffer: Move current to prev",
		["<A-1>"] = "buffer: Goto buffer 1",
		["<A-2>"] = "buffer: Goto buffer 2",
		["<A-3>"] = "buffer: Goto buffer 3",
		["<A-4>"] = "buffer: Goto buffer 4",
		["<A-5>"] = "buffer: Goto buffer 5",
		["<A-6>"] = "buffer: Goto buffer 6",
		["<A-7>"] = "buffer: Goto buffer 7",
		["<A-8>"] = "buffer: Goto buffer 8",
		["<A-9>"] = "buffer: Goto buffer 9",

		-- Terminals
		["<A-d>"] = { mode = { "n", "i", "t" }, "terminal: Toggle float" },
		["<A-\\>"] = { mode = { "n", "i", "t" }, "terminal: Toggle horizontal" },
		["<A-S-\\>"] = { mode = { "n", "i", "t" }, "terminal: Toggle vertical" },
		["<F5>"] = { mode = { "n", "i", "t" }, "terminal: Toggle vertical" },

		-- Miscellaneous
		["<F6>"] = "debug: Run/Continue",
		["<F7>"] = "debug: Terminate debug session",
		["<F8>"] = "debug: Toggle breakpoint",
		["<F9>"] = "debug: Step into",
		["<F10>"] = "debug: Step out",
		["<F11>"] = "debug: Step over",
		["<F12>"] = "tool: Markdown preview",
		["<Esc>"] = "edit: Clear search highlight",
		["<C-n>"] = "filetree: Toggle",
		["<C-S-s>"] = "edit: Save file using sudo",
		["<A-h>"] = { { mode = "i", "edit: Goto begin of pair" } },
		["<A-l>"] = { { mode = "i", "edit: Goto end of pair" } },
	})
end
