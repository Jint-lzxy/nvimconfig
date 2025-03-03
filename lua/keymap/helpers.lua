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

_G._toggle_inlayhint = function()
	local is_enabled = vim.lsp.inlay_hint.is_enabled()

	vim.lsp.inlay_hint.enable(not is_enabled)
	vim.notify(
		(is_enabled and "Inlay hint disabled successfully" or "Inlay hint enabled successfully"),
		vim.log.levels.INFO,
		{ title = "LSP Inlay Hint" }
	)
end

local _vt_enabled = require("core.settings").diagnostics_virtual_text
_G._toggle_virtualtext = function()
	if vim.diagnostic.is_enabled() then
		_vt_enabled = not _vt_enabled
		vim.diagnostic[_vt_enabled and "show" or "hide"]()
		vim.notify(
			(_vt_enabled and "Virtual text is now displayed" or "Virtual text is now hidden"),
			vim.log.levels.INFO,
			{ title = "LSP Diagnostic" }
		)
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
