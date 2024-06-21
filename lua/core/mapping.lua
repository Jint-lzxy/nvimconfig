local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- Core mappings
local core_map = {
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
	["n|<leader>qn"] = map_cr("cnext"):with_noremap():with_silent(),
	["n|<leader>qp"] = map_cr("cprevious"):with_noremap():with_silent(),
	["n|<leader>qo"] = map_cr("copen"):with_noremap():with_silent(),
	["n|<leader>qc"] = map_cr("cclose"):with_noremap():with_silent(),
	["n|<leader>qq"] = map_cr("cclose"):with_noremap():with_silent(),
	["n|<leader>tc"] = map_cr("tabclose"):with_noremap():with_silent(),
	["n|<leader>td"] = map_cr("tabclose"):with_noremap():with_silent(),
	["n|<leader>tj"] = map_cr("tabprevious"):with_noremap():with_silent(),
	["n|<leader>tk"] = map_cr("tabnext"):with_noremap():with_silent(),
	["n|<leader>tn"] = map_cr("tabnew"):with_noremap():with_silent(),
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
	["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
	-- Visual mode
	["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_silent(),
	["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_silent(),
	["v|<"] = map_cmd("<gv"):with_silent(),
	["v|>"] = map_cmd(">gv"):with_silent(),
	-- Accoustomed Settings
	["n|<Up>"] = map_cr("resize +1"):with_silent():with_noremap(),
	["n|<Down>"] = map_cr("resize -1"):with_silent():with_noremap(),
	["n|<Left>"] = map_cr("vertical resize +2"):with_silent():with_noremap(),
	["n|<Right>"] = map_cr("vertical resize -2"):with_silent():with_noremap(),
	["n|ø"] = map_cmd("<Esc><C-w>q"):with_noremap():with_noremap(),
}

bind.nvim_load_mapping(core_map)
