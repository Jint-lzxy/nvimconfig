local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymap.helpers")

local mappings = {
	core = {
		-- Vim map
		["n|<Esc>"] = map_cu("lua _flash_esc_or_noh()"):with_noremap():with_silent(),
		["n|<S-Tab>"] = map_cr("normal za"):with_noremap():with_silent(),
		["n|<C-s>"] = map_cu("write"):with_noremap():with_silent(),
		["n|Y"] = map_cmd("y$"),
		["n|D"] = map_cmd("d$"),
		["n|n"] = map_cmd("nzzzv"):with_noremap(),
		["n|N"] = map_cmd("Nzzzv"):with_noremap(),
		["n|J"] = map_cmd("mzJ`z"):with_noremap(),
		["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap(),
		["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap(),
		["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap(),
		["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap(),
		["t|<C-h>"] = map_cmd("<Cmd>wincmd h<CR>"):with_silent():with_noremap(),
		["t|<C-k>"] = map_cmd("<Cmd>wincmd k<CR>"):with_silent():with_noremap(),
		["n|“"] = map_cr("vertical resize -5"):with_silent(),
		["n|‘"] = map_cr("vertical resize +5"):with_silent(),
		["n|…"] = map_cr("resize -2"):with_silent(),
		["n|æ"] = map_cr("resize +2"):with_silent(),
		["n|<C-q>"] = map_cr("wq"):with_noremap():with_silent(),
		["n|Œ"] = map_cr("q!"):with_noremap():with_silent(),
		["n|<leader>c"] = map_cr("setlocal spell! spelllang=en_us"):with_noremap(),
		["x|<leader>p"] = map_cmd('"_dP'):with_silent():with_noremap(),
		["n|+"] = map_cmd("<C-a>"):with_noremap():with_silent(),
		["n|-"] = map_cmd("<C-x>"):with_noremap():with_silent(),
		["n|<C-a>"] = map_cmd("gg0vG$"):with_noremap():with_silent(),
		["x|<C-a>"] = map_cmd("<Esc>gg0vG$"):with_noremap():with_silent(),
		["n|<leader>qa"] = map_cr("cabove"):with_noremap():with_silent(),
		["n|<leader>qb"] = map_cr("cbelow"):with_noremap():with_silent(),
		["n|<leader>qf"] = map_cr("cfirst"):with_noremap():with_silent(),
		["n|<leader>ql"] = map_cr("clast"):with_noremap():with_silent(),
		["n|<leader>qn"] = map_cr("cnext"):with_noremap():with_silent(),
		["n|<leader>qp"] = map_cr("cprevious"):with_noremap():with_silent(),
		["n|<leader>qo"] = map_cr("copen"):with_noremap():with_silent(),
		["n|<leader>qc"] = map_cr("cclose"):with_noremap():with_silent(),
		["n|<leader>qq"] = map_cr("cclose"):with_noremap():with_silent(),
		["n|<leader>tc"] = map_cr("tabclose"):with_noremap():with_silent(),
		["n|<leader>td"] = map_cr("tabclose"):with_noremap():with_silent(),
		["n|<leader>tj"] = map_cr("tabprevious"):with_noremap():with_silent(),
		["n|<leader>tp"] = map_cr("tabprevious"):with_noremap():with_silent(),
		["n|<leader>tk"] = map_cr("tabnext"):with_noremap():with_silent(),
		["n|<leader>tn"] = map_cr("tabnext"):with_noremap():with_silent(),
		["n|<leader>tN"] = map_cr("tabnew"):with_noremap():with_silent(),
		["n|<leader>to"] = map_cr("tabonly"):with_noremap():with_silent(),
		-- Insert mode
		["i|<C-u>"] = map_cmd("<C-g>u<C-u>"):with_noremap(),
		["i|<C-b>"] = map_cmd("<Left>"):with_noremap(),
		["i|<C-a>"] = map_cmd("<Esc>^i"):with_noremap(),
		["i|<C-s>"] = map_cmd("<Esc>:w<CR>"),
		["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"),
		-- Command mode
		["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
		["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
		["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
		["c|<C-e>"] = map_cmd("<End>"):with_noremap(),
		["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
		["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
		["c|<C-S-f>"] = map_cmd("<C-f>"):with_noremap(),
		["c|%%"] = map_cmd([[getcmdtype() == ':' ? expand('%:h').'/' : '%%']]):with_expr():with_noremap(),
		-- Visual mode
		["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_silent(),
		["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_silent(),
		["v|<"] = map_cmd("<gv"):with_silent(),
		["v|>"] = map_cmd(">gv"):with_silent(),
		-- Accoustomed Settings
		["n|¨"] = map_cr("setlocal undofile! undofile?"):with_noremap(),
		["n|<Up>"] = map_cmd("<Plug>ResizeWindowUp"):with_silent():with_noremap(),
		["n|<Down>"] = map_cmd("<Plug>ResizeWindowDown"):with_silent():with_noremap(),
		["n|<Left>"] = map_cmd("<Plug>ResizeWindowLeft"):with_silent():with_noremap(),
		["n|<Right>"] = map_cmd("<Plug>ResizeWindowRight"):with_silent():with_noremap(),
	},

	plugins = {
		-- Bufferline
		["n|∆"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
		["n|˚"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
		["n|Ô"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent(),
		["n|"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
		["n|π"] = map_cr("BufferLineTogglePin"):with_noremap():with_silent(),
		["n|¡"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
		["n|™"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
		["n|£"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
		["n|¢"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
		["n|∞"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
		["n|§"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
		["n|¶"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
		["n|•"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
		["n|ª"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
		["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap(),
		["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap(),
		-- Lazy.nvim
		["n|<leader>ph"] = map_cr("Lazy"):with_silent():with_noremap():with_nowait(),
		["n|<leader>ps"] = map_cr("Lazy sync"):with_silent():with_noremap():with_nowait(),
		["n|<leader>pu"] = map_cr("Lazy update"):with_silent():with_noremap():with_nowait(),
		["n|<leader>pi"] = map_cr("Lazy install"):with_silent():with_noremap():with_nowait(),
		["n|<leader>pl"] = map_cr("Lazy log"):with_silent():with_noremap():with_nowait(),
		["n|<leader>pc"] = map_cr("Lazy check"):with_silent():with_noremap():with_nowait(),
		["n|<leader>pd"] = map_cr("Lazy debug"):with_silent():with_noremap():with_nowait(),
		["n|<leader>pp"] = map_cr("Lazy profile"):with_silent():with_noremap():with_nowait(),
		["n|<leader>pr"] = map_cr("Lazy restore"):with_silent():with_noremap():with_nowait(),
		["n|<leader>px"] = map_cr("Lazy clean"):with_silent():with_noremap():with_nowait(),
		-- LSP
		["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
		["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),
		["n|<leader>ls"] = map_cr("LspStop"):with_noremap():with_silent():with_nowait(),
		["n|<leader>lS"] = map_cr("LspStart"):with_noremap():with_silent():with_nowait(),
		["n|Ï"] = map_cr("Format"):with_noremap():with_silent(),
		["n|ƒ"] = map_cr("FormatToggle"):with_noremap():with_silent(),
		["n|go"] = map_cr("Outline"):with_noremap():with_silent(),
		["n|g["] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
		["n|g]"] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
		["n|<leader>lx"] = map_cr("Lspsaga show_line_diagnostics ++unfocus"):with_noremap():with_silent(),
		["n|gr"] = map_cr("Lspsaga rename"):with_noremap():with_silent():with_nowait(),
		["n|gR"] = map_cr("Lspsaga rename ++project"):with_noremap():with_silent(),
		["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
		["nv|ga"] = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
		["n|gd"] = map_cr("Glance definitions"):with_noremap():with_silent(),
		["n|gD"] = map_cr("Lspsaga goto_definition"):with_noremap():with_silent(),
		["n|gh"] = map_cr("Glance references"):with_noremap():with_silent(),
		["n|gt"] = map_cr("Glance type_definitions"):with_noremap():with_silent(),
		["n|gm"] = map_cr("Glance implementations"):with_noremap():with_silent(),
		["n|gli"] = map_cr("Lspsaga incoming_calls"):with_noremap():with_silent(),
		["n|glo"] = map_cr("Lspsaga outgoing_calls"):with_noremap():with_silent(),
		["n|<leader>lv"] = map_cu("lua _toggle_virtualtext()"):with_noremap():with_silent(),
		["n|<leader>lh"] = map_cu("lua _toggle_inlayhint()"):with_noremap():with_silent(),
		-- vim-fugitive
		["n|<leader>gG"] = map_cu("Git"):with_noremap():with_silent(),
		["n|gps"] = map_cr("G push"):with_noremap():with_silent(),
		["n|gpl"] = map_cr("G pull"):with_noremap():with_silent(),
		-- Terminal
		--- Global
		["t|œ"] = map_cmd("<C-\\><C-n>"):with_noremap():with_silent(), -- switch to normal mode in terminal
		--- Floating
		["n|∂"] = map_cr("ToggleTerm direction=float"):with_noremap():with_silent(),
		["i|∂"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>"):with_noremap():with_silent(),
		["t|∂"] = map_cu("<C-\\><C-n><Cmd>ToggleTerm"):with_noremap():with_silent(),
		["n|<leader>gg"] = map_cu("lua _toggle_lazygit()"):with_noremap():with_silent(),
		--- Horizontal / Vertical
		["n|«"] = map_cr("ToggleTerm direction=horizontal"):with_noremap():with_silent(),
		["i|«"] = map_cmd("<Esc><Cmd>ToggleTerm direction=horizontal<CR>"):with_noremap():with_silent(),
		["t|«"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent(),
		["n|»"] = map_cr("ToggleTerm direction=vertical"):with_noremap():with_silent(),
		["i|»"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>"):with_noremap():with_silent(),
		["t|»"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent(),
		["n|<F5>"] = map_cr("ToggleTerm direction=vertical"):with_noremap():with_silent(),
		["i|<F5>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>"):with_noremap():with_silent(),
		["t|<F5>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent(),
		-- Plugin suda.vim
		["n|<C-S-s>"] = map_cu("SudaWrite"):with_silent():with_noremap(),
		-- Plugin trouble.nvim
		["n|<leader>lw"] = map_cr("Trouble diagnostics toggle"):with_noremap():with_silent(),
		["n|<leader>lp"] = map_cr("Trouble project_diagnostics toggle"):with_noremap():with_silent(),
		["n|<leader>ld"] = map_cr("Trouble diagnostics toggle filter.buf=0"):with_noremap():with_silent(),
		-- Plugin nvim-tree
		["n|<C-n>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
		["n|<leader>nf"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
		["n|<leader>nr"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent(),
		-- Plugin Undotree
		["n|<leader>u"] = map_cr("UndotreeToggle"):with_noremap():with_silent(),
		-- Plugin Telescope
		["n|<leader>fn"] = map_cu("enew"):with_noremap():with_silent(),
		["n|<leader>fk"] = map_cu("lua _command_panel()"):with_noremap():with_silent(),
		["n|<leader>fp"] = map_cu("lua require('telescope').extensions.projects.projects{}")
			:with_noremap()
			:with_silent(),
		["n|<leader>fr"] = map_cu("lua require('telescope').extensions.frecency.frecency{}")
			:with_noremap()
			:with_silent(),
		["n|<leader>fw"] = map_cu("lua require('telescope').extensions.live_grep_args.live_grep_args{}")
			:with_noremap()
			:with_silent(),
		["n|<leader>fa"] = map_cu("Telescope autocommands"):with_noremap():with_silent(),
		["n|<leader>fb"] = map_cu("Telescope buffers"):with_noremap():with_silent(),
		["n|<leader>fc"] = map_cu("Telescope colorscheme"):with_noremap():with_silent(),
		["n|<leader>fd"] = map_cu("Telescope persisted"):with_noremap():with_silent(),
		["n|<leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent(),
		["n|<leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent(),
		["n|<leader>fg"] = map_cu("Telescope git_files"):with_noremap():with_silent(),
		["n|<leader>fh"] = map_cu("Telescope highlights"):with_noremap():with_silent(),
		["n|<leader>fi"] = map_cu("Telescope file_browser path=%:p:h"):with_noremap():with_silent(),
		["n|<leader>fo"] = map_cu("Telescope vim_options"):with_noremap():with_silent(),
		["n|<leader>fR"] = map_cu("Telescope resume"):with_noremap():with_silent(),
		["nv|<leader>fs"] = map_cu("Telescope grep_string"):with_noremap():with_silent(),
		["n|<leader>ft"] = map_cu("TodoTelescope"):with_noremap():with_silent(),
		["n|<leader>fz"] = map_cu("Telescope zoxide list"):with_noremap():with_silent(),
		-- Plugin nvim-bufdel
		["n|œ"] = map_cr("BufDel"):with_noremap():with_silent(),
		-- Plugin Hop
		["nv|<leader>w"] = map_cmd("<Cmd>HopWordMW<CR>"):with_noremap(),
		["nv|<leader>j"] = map_cmd("<Cmd>HopLineMW<CR>"):with_noremap(),
		["nv|<leader>k"] = map_cmd("<Cmd>HopLineMW<CR>"):with_noremap(),
		["nv|<leader>o"] = map_cmd("<Cmd>HopChar1MW<CR>"):with_noremap(),
		["nv|<leader>O"] = map_cmd("<Cmd>HopChar2MW<CR>"):with_noremap(),
		-- Plugin render-markdown.nvim
		["n|<F1>"] = map_cr("RenderMarkdown toggle"):with_noremap():with_silent(),
		-- Plugin MarkdownPreview
		["n|<F12>"] = map_cr("MarkdownPreviewToggle"):with_noremap():with_silent(),
		-- Plugin persisted.nvim
		["n|<leader>sd"] = map_cu("SessionDelete"):with_noremap():with_silent(),
		["n|<leader>sl"] = map_cu("SessionLoad"):with_noremap():with_silent(),
		["n|<leader>sr"] = map_cu("ProjectRoot"):with_noremap():with_silent(),
		["n|<leader>ss"] = map_cu("SessionSave"):with_noremap():with_silent(),
		["n|<leader>st"] = map_cu("SessionToggle"):with_noremap():with_silent(),
		-- Plugin SnipRun
		["n|<leader>r"] = map_cu([[%SnipRun]]):with_noremap():with_silent(),
		["v|<leader>r"] = map_cr("SnipRun"):with_noremap():with_silent(),
		-- Plugin dap
		["n|<F6>"] = map_cr("lua require('dap').continue()"):with_noremap():with_silent(),
		["n|<F7>"] = map_cr("lua require('dap').terminate()"):with_noremap():with_silent(),
		["n|<F8>"] = map_cr("lua require('dap').toggle_breakpoint()"):with_noremap():with_silent(),
		["n|<F9>"] = map_cr("lua require('dap').step_into()"):with_noremap():with_silent(),
		["n|<F10>"] = map_cr("lua require('dap').step_out()"):with_noremap():with_silent(),
		["n|<F11>"] = map_cr("lua require('dap').step_over()"):with_noremap():with_silent(),
		["n|<leader>db"] = map_cr("lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))")
			:with_noremap()
			:with_silent(),
		["n|<leader>dB"] = map_cr("lua require('dap').list_breakpoints()"):with_noremap():with_silent(),
		["n|<leader>dc"] = map_cr("lua require('dap').run_to_cursor()"):with_noremap():with_silent(),
		["n|<leader>dd"] = map_cr("lua require('dapui').close()"):with_noremap():with_silent(),
		["n|<leader>di"] = map_cr("lua require('dap').step_into()"):with_noremap():with_silent(),
		["n|<leader>dl"] = map_cr("lua require('dap').run_last()"):with_noremap():with_silent(),
		["n|<leader>do"] = map_cr("lua require('dap').step_out()"):with_noremap():with_silent(),
		["n|<leader>dO"] = map_cr("lua require('dap').repl.open()"):with_noremap():with_silent(),
		["n|<leader>dr"] = map_cr("lua require('dap').continue()"):with_noremap():with_silent(),
		["n|<leader>dn"] = map_cr("lua require('osv').launch({ port = 7052 })"):with_noremap():with_silent(),
		["n|<leader>dR"] = map_cr("lua require('osv').run_this()"):with_noremap():with_silent(),
		["n|<leader>dt"] = map_cr("lua require('dap').terminate()"):with_noremap():with_silent(),
		["n|<leader>dv"] = map_cr("lua require('dap').step_over()"):with_noremap():with_silent(),
		-- Plugin Treehopper
		["o|m"] = map_cu("lua require('tsht').nodes()"):with_silent(),
		["x|m"] = map_cr("lua require('tsht').nodes()"):with_noremap():with_silent(),
		-- Plugin Tabout
		["i|¬"] = map_cmd("<Plug>(TaboutMulti)"):with_silent(),
		["i|˙"] = map_cmd("<Plug>(TaboutBackMulti)"):with_silent(),
		-- Plugin Diffview
		["n|<leader>gd"] = map_cr("DiffviewOpen"):with_silent():with_noremap(),
		["n|<leader>gD"] = map_cr("DiffviewClose"):with_silent():with_noremap(),
		["n|<leader>gf"] = map_cr("DiffviewFileHistory %"):with_silent():with_noremap(),
		["n|<leader>gF"] = map_cr("DiffviewClose"):with_silent():with_noremap(),
	},
}

bind.nvim_load_mapping(mappings.core)
bind.nvim_load_mapping(mappings.plugins)
