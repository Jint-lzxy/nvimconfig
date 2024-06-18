return function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	require("modules.utils").gen_alpha_hl()

	dashboard.section.header.val = {
		[[      .-') _   ('-.                     (`-.           _   .-')     ]],
		[[     ( OO ) )_(  OO)                  _(OO  )_        ( '.( OO )_   ]],
		[[ ,--./ ,--,'(,------. .-'),-----. ,--(_/   ,. \ ,-.-') ,--.   ,--.) ]],
		[[ |   \ |  |\ |  .---'( OO'  .-.  '\   \   /(__/ |  |OO)|   `.'   |  ]],
		[[ |    \|  | )|  |    /   |  | |  | \   \ /   /  |  |  \|         |  ]],
		[[ |  .     |/(|  '--. \_) |  |\|  |  \   '   /,  |  |(_/|  |'.'|  |  ]],
		[[ |  |\    |  |  .--'   \ |  | |  |   \     /__),|  |_.'|  |   |  |  ]],
		[[ |  | \   |  |  `---.   `'  '-'  '    \   /   (_|  |   |  |   |  |  ]],
		[[ `--'  `--'  `------'     `-----'      `-'      `--'   `--'   `--'  ]],
		[[                                                                    ]],
		[[   Configuration by jint_lzxy_                       ver ]] .. os.date("%Y.%m") .. [[     ]],
	}
	dashboard.section.header.opts.hl = "AlphaHeader"

	local function button(sc, txt, leader_txt, keybind, keybind_opts)
		local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 5,
			width = 50,
			align_shortcut = "right",
			hl = "AlphaButtons",
			hl_shortcut = "AlphaShortcut",
		}

		if keybind == nil then
			keybind = sc_after
		end
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_after, keybind, keybind_opts }

		local function on_press()
			local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "t", false)
		end

		return {
			type = "button",
			val = txt,
			on_press = on_press,
			opts = opts,
		}
	end

	local leader = "<leader>"
	dashboard.section.buttons.val = {
		button("[leader] f c", " Scheme change", leader, "<Cmd>Telescope colorscheme<CR>"),
		button("[leader] f r", " File frecency", leader, "<Cmd>Telescope frecency<CR>"),
		button("[leader] f e", "󰋚 File history", leader, "<Cmd>Telescope oldfiles<CR>"),
		button("[leader] f p", " Project find", leader, "<Cmd>Telescope projects<CR>"),
		button("[leader] f f", "󰈞 File find", leader, "<Cmd>Telescope find_files<CR>"),
		button("[leader] f n", " New file", leader, "<Cmd>enew<CR>"),
		button("[leader] f w", " Word find", leader, "<Cmd>Telescope live_grep<CR>"),
	}
	dashboard.section.buttons.opts.hl = "AlphaButtons"

	local function footer()
		local stats = require("lazy").stats()
		local greet = " 💝  Have Fun with Neovim"
			.. "  󰀨 v"
			.. vim.version().major
			.. "."
			.. vim.version().minor
			.. "."
			.. vim.version().patch
			.. "  󰂖 "
			.. stats.count
			.. " plugins"
		local quote = table.concat(require("alpha.fortune")(), "\n")
		return greet .. "\n" .. quote
	end

	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "AlphaFooter"

	local head_bot_padding = 2
	local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_bot_padding
	local header_padding = math.max(0, math.ceil((vim.fn.winheight(0) - occu_height) * 0.25))
	local foot_bot_padding = 1

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.header,
		{ type = "padding", val = head_bot_padding },
		dashboard.section.buttons,
		{ type = "padding", val = foot_bot_padding },
		dashboard.section.footer,
	}
	alpha.setup(dashboard.opts)
end
