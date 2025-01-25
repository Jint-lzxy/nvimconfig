-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/lua_ls.lua
return {
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			telemetry = { enable = false },
			hint = { enable = true, setType = true },
			-- Do not override treesitter lua highlighting with lua_ls' highlighting
			semantic = { enable = false },
		},
	},
}
