local vim = vim

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G._enhance_jk_move = function(key)
	local map = key == "j" and "<Plug>(accelerated_jk_gj)" or "<Plug>(accelerated_jk_gk)"
	return t(map)
end

_G._enhance_ft_move = function(key)
	local map = {
		[";"] = "<Plug>(clever-f-repeat-forward)",
		[","] = "<Plug>(clever-f-repeat-back)",
	}
	return t(map[key])
end

_G._command_panel = function()
	require("telescope.builtin").keymaps({
		lhs_filter = function(lhs)
			return not string.find(lhs, "Þ")
		end,
	})
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
