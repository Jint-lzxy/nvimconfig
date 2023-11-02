local vim = vim

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G._enhance_jk_move = function(key)
	local map = key == "j" and "<Plug>(accelerated_jk_gj)" or "<Plug>(accelerated_jk_gk)"
	return t(map)
end

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
		vim.cmd([[noh]])
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
