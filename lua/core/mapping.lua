local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
	-- Vim map
	["n|<S-Tab>"] = map_cr("normal za"):with_noremap():with_silent(),
	["n|<C-s>"] = map_cu("write"):with_noremap():with_silent(),
	["n|<C-S-s>"] = map_cmd("execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"):with_silent():with_noremap(),
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
	["t|<C-l>"] = map_cmd("<Cmd>wincmd l<CR>"):with_silent():with_noremap(),
	["t|<C-j>"] = map_cmd("<Cmd>wincmd j<CR>"):with_silent():with_noremap(),
	["t|<C-k>"] = map_cmd("<Cmd>wincmd k<CR>"):with_silent():with_noremap(),
	["n|“"] = map_cr("vertical resize -5"):with_silent(),
	["n|‘"] = map_cr("vertical resize +5"):with_silent(),
	["n|…"] = map_cr("resize -2"):with_silent(),
	["n|æ"] = map_cr("resize +2"):with_silent(),
	["n|<C-q>"] = map_cmd(":wq<CR>"),
	["n|Œ"] = map_cmd(":q!<CR>"),
	["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"),
	["x|<leader>p"] = map_cmd('"_dP'):with_silent():with_noremap(),
	-- Insert
	["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap(),
	["i|<C-b>"] = map_cmd("<Left>"):with_noremap(),
	["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap(),
	["i|<C-s>"] = map_cmd("<Esc>:w<CR>"),
	["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"),
	-- command line
	["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
	["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
	["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
	["c|<C-e>"] = map_cmd("<End>"):with_noremap(),
	["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
	["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
	["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
	-- Visual
	["v|J"] = map_cmd(":m '>+1<CR>gv=gv"),
	["v|K"] = map_cmd(":m '<-2<CR>gv=gv"),
	["v|<"] = map_cmd("<gv"),
	["v|>"] = map_cmd(">gv"),
	-- Accoustomed Settings
	["n|<Up>"] = map_cr("resize +1"):with_silent():with_noremap(),
	["n|<Down>"] = map_cr("resize -1"):with_silent():with_noremap(),
	["n|<Left>"] = map_cr("vertical resize +2"):with_silent():with_noremap(),
	["n|<Right>"] = map_cr("vertical resize -2"):with_silent():with_noremap(),
	["n|ø"] = map_cmd("<Esc><C-w>q"),
}

bind.nvim_load_mapping(def_map)
