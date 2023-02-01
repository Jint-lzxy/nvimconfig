return function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
		[[      ██╗██╗███╗   ██╗████████╗   ██╗     ███████╗██╗  ██╗██╗   ██╗ ]],
		[[      ██║██║████╗  ██║╚══██╔══╝   ██║     ╚══███╔╝╚██╗██╔╝╚██╗ ██╔╝ ]],
		[[      ██║██║██╔██╗ ██║   ██║█████╗██║       ███╔╝  ╚███╔╝  ╚████╔╝  ]],
		[[ ██   ██║██║██║╚██╗██║   ██║╚════╝██║      ███╔╝   ██╔██╗   ╚██╔╝   ]],
		[[ ╚█████╔╝██║██║ ╚████║   ██║      ███████╗███████╗██╔╝ ██╗   ██║    ]],
		[[  ╚════╝ ╚═╝╚═╝  ╚═══╝   ╚═╝      ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ]],
		[[                                                                    ]],
		[[    Configuration By 冷酔閑吟                       ver ]] .. os.date("%Y.%m") .. [[     ]],
	}
	dashboard.section.header.opts.hl = "Type"

	local function button(sc, txt, leader_txt, keybind, keybind_opts)
		local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 5,
			width = 50,
			align_shortcut = "right",
			hl = "String",
			hl_shortcut = "Keyword",
		}

		if keybind == nil then
			keybind = sc_after
		end
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_after, keybind, keybind_opts }

		local function on_press()
			-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
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
		button("[leader] f c", " Scheme change", leader, "<cmd>Telescope colorscheme<cr>"),
		button("[leader] f r", " File frecency", leader, "<cmd>Telescope frecency<cr>"),
		button("[leader] f e", " File history", leader, "<cmd>Telescope oldfiles<cr>"),
		button("[leader] f p", " Project find", leader, "<cmd>Telescope projects<cr>"),
		button("[leader] f f", " File find", leader, "<cmd>Telescope find_files<cr>"),
		button("[leader] f n", " File new", leader, "<cmd>enew<cr>"),
		button("[leader] f w", " Word find", leader, "<cmd>Telescope live_grep<cr>"),
	}
	dashboard.section.buttons.opts.hl = "String"

	local function footer()
		local stats = require("lazy").stats()
		local greet = " 💝  Have Fun with neovim"
			.. "   v"
			.. vim.version().major
			.. "."
			.. vim.version().minor
			.. "."
			.. vim.version().patch
			.. "   "
			.. stats.count
			.. " plugins"
		local quote = table.concat(require("alpha.fortune")(), "\n")
		return greet .. "\n" .. quote
	end

	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "Typedef"

	local head_butt_padding = 2
	local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
	local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
	local foot_butt_padding = 1

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.header,
		{ type = "padding", val = head_butt_padding },
		dashboard.section.buttons,
		{ type = "padding", val = foot_butt_padding },
		dashboard.section.footer,
	}
	alpha.setup(dashboard.opts)
end
