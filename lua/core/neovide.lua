-- Neovide-specific configs
if vim.g.neovide then
	-- Options
	for name, config in pairs(require("core.settings").neovide_config) do
		vim.g["neovide_" .. name] = config
	end

	-- Keymaps
	local bind = require("keymap.bind")
	local map_cu = bind.map_cu
	local map_cmd = bind.map_cmd

	local neovide_map = {
		["n|<D-s>"] = map_cu("write"):with_noremap():with_silent(),
		["v|<D-c>"] = map_cmd('"+y'):with_noremap(),
		["nv|<D-v>"] = map_cmd('"+P'):with_noremap(),
		["c|<D-v>"] = map_cmd("<C-r>+"):with_noremap(),
		["i|<D-v>"] = map_cmd('<Esc>l"+Pli'):with_noremap(),
	}

	bind.nvim_load_mapping(neovide_map)
end
