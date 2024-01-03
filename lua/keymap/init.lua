local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymap.config")

local plug_map = {
	-- Bufferline
	["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
	["n|˚"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
	["n|∆"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
	["n|Ô"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent(),
	["n|"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
	["n|π"] = map_cr("BufferLineTogglePin"):with_noremap():with_silent(),
	["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap(),
	["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap(),
	["n|¡"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
	["n|™"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
	["n|£"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
	["n|¢"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
	["n|∞"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
	["n|§"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
	["n|¶"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
	["n|•"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
	["n|ª"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
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
	-- Lsp
	["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
	["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),
	["n|<leader>ls"] = map_cr("LspStart"):with_noremap():with_silent():with_nowait(),
	["n|<leader>lS"] = map_cr("LspStop"):with_noremap():with_silent():with_nowait(),
	["n|†"] = map_cr("SymbolsOutline"):with_noremap():with_silent(),
	["n|g["] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
	["n|g]"] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
	["n|<leader>ld"] = map_cr("Lspsaga show_line_diagnostics ++unfocus"):with_noremap():with_silent(),
	["n|gs"] = map_cr("lua vim.lsp.buf.signature_help()"):with_noremap():with_silent(),
	["n|gr"] = map_cr("Lspsaga rename"):with_noremap():with_silent(),
	["n|gR"] = map_cr("Lspsaga rename ++project"):with_noremap():with_silent(),
	["n|K"] = map_cmd("<Cmd>Lspsaga hover_doc<CR>"):with_noremap():with_silent(),
	["nv|<leader>ca"] = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
	["n|gd"] = map_cr("Glance definitions"):with_noremap():with_silent(),
	["n|gD"] = map_cr("Lspsaga goto_definition"):with_noremap():with_silent(),
	["n|gh"] = map_cr("Glance references"):with_noremap():with_silent(),
	["n|gt"] = map_cr("Glance type_definitions"):with_noremap():with_silent(),
	["n|gm"] = map_cr("Glance implementations"):with_noremap():with_silent(),
	["n|<leader>ci"] = map_cr("Lspsaga incoming_calls"):with_noremap():with_silent(),
	["n|<leader>co"] = map_cr("Lspsaga outgoing_calls"):with_noremap():with_silent(),
	["n|<leader>G"] = map_cu("Git"):with_noremap():with_silent(),
	["n|gpP"] = map_cr("G push"):with_noremap():with_silent(),
	["n|gpp"] = map_cr("G pull"):with_noremap():with_silent(),
	-- Toggle Terminal
	-- Global
	["t|œ"] = map_cmd("<C-\\><C-n>"):with_noremap():with_silent(), -- switch to normal mode in terminal.
	-- Floating
	["n|∂"] = map_cr("ToggleTerm direction=float"):with_noremap():with_silent(),
	["i|∂"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>"):with_noremap():with_silent(),
	["t|∂"] = map_cu("<C-\\><C-n><Cmd>ToggleTerm"):with_noremap():with_silent(),
	["n|<leader>g"] = map_cu("lua _toggle_lazygit()"):with_noremap():with_silent(),
	-- Horizontal / Vertical
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
	-- Plugin trouble
	["n|<leader>cr"] = map_cr("TroubleToggle lsp_references"):with_noremap():with_silent(),
	["n|<leader>cd"] = map_cr("TroubleToggle document_diagnostics"):with_noremap():with_silent(),
	["n|<leader>cw"] = map_cr("TroubleToggle workspace_diagnostics"):with_noremap():with_silent(),
	["n|<leader>cq"] = map_cr("TroubleToggle quickfix"):with_noremap():with_silent(),
	["n|<leader>cl"] = map_cr("TroubleToggle loclist"):with_noremap():with_silent(),
	-- Plugin nvim-tree
	["n|<C-n>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
	["n|<leader>nf"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
	["n|<leader>nr"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent(),
	-- Plugin Undotree
	["n|<leader>u"] = map_cr("UndotreeToggle"):with_noremap():with_silent(),
	-- Plugin Telescope
	["n|<leader>fn"] = map_cu(":enew"):with_noremap():with_silent(),
	["n|<leader>fk"] = map_cu("lua _command_panel()"):with_noremap():with_silent(),
	["n|<leader>fp"] = map_cu("lua require('telescope').extensions.projects.projects{}"):with_noremap():with_silent(),
	["n|<leader>fr"] = map_cu("lua require('telescope').extensions.frecency.frecency{}"):with_noremap():with_silent(),
	["n|<leader>fw"] = map_cu("lua require('telescope').extensions.live_grep_args.live_grep_args{}")
		:with_noremap()
		:with_silent(),
	["n|<leader>fR"] = map_cu("Telescope resume"):with_noremap():with_silent(),
	["n|<leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent(),
	["n|<leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent(),
	["n|<leader>fi"] = map_cu("Telescope file_browser path=%:p:h"):with_noremap():with_silent(),
	["n|<leader>fc"] = map_cu("Telescope colorscheme"):with_noremap():with_silent(),
	["n|<leader>fg"] = map_cu("Telescope git_files"):with_noremap():with_silent(),
	["n|<leader>fb"] = map_cu("Telescope buffers"):with_noremap():with_silent(),
	["n|<leader>fs"] = map_cu("Telescope grep_string"):with_noremap():with_silent(),
	["n|<leader>fd"] = map_cu("Telescope persisted"):with_noremap():with_silent(),
	["n|<leader>fh"] = map_cu("Telescope highlights"):with_noremap():with_silent(),
	["n|<leader>fa"] = map_cu("Telescope autocommands"):with_noremap():with_silent(),
	["n|<leader>fo"] = map_cu("Telescope vim_options"):with_noremap():with_silent(),
	["n|<leader>fz"] = map_cu("Telescope zoxide list"):with_noremap():with_silent(),
	["n|<leader>ft"] = map_cu("TodoTelescope"):with_noremap():with_silent(),
	-- Plugin accelerate-jk
	["n|j"] = map_cmd("v:lua._enhance_jk_move('j')"):with_silent():with_expr(),
	["n|k"] = map_cmd("v:lua._enhance_jk_move('k')"):with_silent():with_expr(),
	-- Plugin nvim-bufdel
	["n|œ"] = map_cr("BufDel"):with_noremap():with_silent(),
	-- Plugin Hop
	["nv|<leader>w"] = map_cmd("<Cmd>HopWordMW<CR>"):with_noremap(),
	["nv|<leader>j"] = map_cmd("<Cmd>HopLineMW<CR>"):with_noremap(),
	["nv|<leader>k"] = map_cmd("<Cmd>HopLineMW<CR>"):with_noremap(),
	["nv|<leader>o"] = map_cmd("<Cmd>HopChar1MW<CR>"):with_noremap(),
	["nv|<leader>oo"] = map_cmd("<Cmd>HopChar2MW<CR>"):with_noremap(),
	-- Plugin EasyAlign
	["nx|gea"] = map_cr("EasyAlign"):with_noremap():with_silent(),
	-- Plugin MarkdownPreview
	["n|<F12>"] = map_cr("MarkdownPreviewToggle"):with_noremap():with_silent(),
	-- Plugin persisted.nvim
	["n|<leader>ss"] = map_cu("SessionSave"):with_noremap():with_silent(),
	["n|<leader>sl"] = map_cu("SessionLoad"):with_noremap():with_silent(),
	["n|<leader>sd"] = map_cu("SessionDelete"):with_noremap():with_silent(),
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
	["n|<leader>dR"] = map_cr("lua require('osv').run_this()"):with_noremap():with_silent(),
	["n|<leader>dt"] = map_cr("lua require('dap').terminate()"):with_noremap():with_silent(),
	["n|<leader>dv"] = map_cr("lua require('dap').step_over()"):with_noremap():with_silent(),
	["o|m"] = map_cu("lua require('tsht').nodes()"):with_silent(),
	["x|m"] = map_cr("lua require('tsht').nodes()"):with_noremap():with_silent(),
	-- Plugin Tabout
	["i|¬"] = map_cmd("<Plug>(TaboutMulti)"):with_silent(),
	["i|˙"] = map_cmd("<Plug>(TaboutBackMulti)"):with_silent(),
	-- Plugin Diffview
	["n|<leader>D"] = map_cr("DiffviewOpen"):with_silent():with_noremap(),
	["n|<leader><leader>D"] = map_cr("DiffviewClose"):with_silent():with_noremap(),
}

bind.nvim_load_mapping(plug_map)
