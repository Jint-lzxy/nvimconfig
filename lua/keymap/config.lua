local vim = vim

_G._command_panel = function()
	require("telescope.builtin").keymaps({
		lhs_filter = function(lhs)
			return not string.find(lhs, "Þ")
		end,
	})
end

_G._flash_esc_or_noh = function()
	local flash_active, state = pcall(function()
		return require("flash.plugins.char").state
	end)
	if flash_active and state then
		state:hide()
	else
		pcall(vim.cmd.noh)
	end
end

local lazygit = nil
_G._toggle_lazygit = function()
	if not lazygit then
		local Terminal = require("toggleterm.terminal").Terminal
		lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			close_on_exit = true,
			hidden = true,
		})
	end
	lazygit:toggle()
end
