-- https://github.com/jbyuki/one-small-step-for-vimkind
local dap = require("dap")

dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to a running Neovim instance",
	},
}

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 7052 })
end
