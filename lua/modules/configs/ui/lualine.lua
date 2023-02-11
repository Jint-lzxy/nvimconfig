return function()
	local colors = require("modules.utils").get_palette({ maroon = "#EA999D", flamingo = "#EEBEBE" })
	local icons = {
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
		misc = require("modules.utils.icons").get("misc"),
		cmp = require("modules.utils.icons").get("cmp"),
	}

	local custom_theme = {
		normal = {
			a = { bg = colors.lavender, fg = colors.mantle, gui = "bold" },
			b = { bg = colors.surface1, fg = colors.lavender },
			c = { bg = colors.mantle, fg = colors.text },

			-- y = { bg = cp.maroon, fg = cp.surface0 },
			-- z = { bg = cp.flamingo, fg = cp.surface0, gui = "bold" },
		},

		insert = {
			a = { bg = colors.green, fg = colors.base, gui = "bold" },
			b = { bg = colors.surface1, fg = colors.teal },

			-- y = { bg = cp.maroon, fg = cp.surface0 },
			-- z = { bg = cp.flamingo, fg = cp.surface0, gui = "bold" },
		},

		command = {
			a = { bg = colors.peach, fg = colors.base, gui = "bold" },
			b = { bg = colors.surface1, fg = colors.peach },

			-- y = { bg = cp.maroon, fg = cp.surface0 },
			-- z = { bg = cp.flamingo, fg = cp.surface0, gui = "bold" },
		},

		visual = {
			a = { bg = colors.flamingo, fg = colors.base, gui = "bold" },
			b = { bg = colors.surface1, fg = colors.flamingo },

			-- y = { bg = cp.maroon, fg = cp.surface0 },
			-- z = { bg = cp.flamingo, fg = cp.surface0, gui = "bold" },
		},

		replace = {
			a = { bg = colors.maroon, fg = colors.base, gui = "bold" },
			b = { bg = colors.surface1, fg = colors.maroon },

			-- y = { bg = cp.maroon, fg = cp.surface0 },
			-- z = { bg = cp.flamingo, fg = cp.surface0, gui = "bold" },
		},

		inactive = {
			a = { bg = colors.mantle, fg = colors.lavender },
			b = { bg = colors.mantle, fg = colors.surface1, gui = "bold" },
			c = { bg = colors.mantle, fg = colors.overlay0 },
		},
	}

	local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
		return function(str)
			local win_width = vim.fn.winwidth(0)
			if hide_width and win_width < hide_width then
				return ""
			elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
				return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
			end
			return str
		end
	end

	local function escape_status()
		local ok, m = pcall(require, "better_escape")
		return ok and m.waiting and icons.misc.EscapeST or ""
	end

	local _cache = { context = "", bufnr = -1 }
	local function lspsaga_symbols()
		local exclude = {
			["terminal"] = true,
			["toggleterm"] = true,
			["prompt"] = true,
			["NvimTree"] = true,
			["help"] = true,
		}
		if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
			return "" -- Excluded filetypes
		else
			local currbuf = vim.api.nvim_get_current_buf()
			local ok, lspsaga = pcall(require, "lspsaga.symbolwinbar")
			if ok and lspsaga:get_winbar() ~= nil then
				_cache.context = lspsaga:get_winbar()
				_cache.bufnr = currbuf
			elseif _cache.bufnr ~= currbuf then
				_cache.context = "" -- Reset [invalid] cache (usually from another buffer)
			end

			return _cache.context
		end
	end

	local function show_lsp()
		local msg = "No Active LSP"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		local lsp_lists = {}
		if next(clients) == nil then
			return msg -- No server available
		end
		msg = "" -- LSP available
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			local client_name = client.name
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				-- Avoid adding servers that already exists.
				if not lsp_lists[client_name] then
					lsp_lists[client_name] = true
					msg = msg .. client_name .. ", "
				end
			end
		end
		return msg == "" and "No Active LSP" or msg:sub(1, -3) -- Remove last comma.
	end

	local function diff_source()
		local gitsigns = vim.b.gitsigns_status_dict
		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end

	local edit_status = {
		function()
			if vim.bo.modified then
				return ""
			elseif not vim.bo.modifiable or vim.bo.readonly then
				return ""
			else
				return ""
			end
		end,
		color = function()
			return {
				fg = vim.bo.modified and colors.green
					or ((not vim.bo.modifiable or vim.bo.readonly) and colors.red or colors.lavender),
				bg = colors.surface0,
			}
		end,
		padding = { left = 1.8, right = 2 },
	}

	local mini_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	}
	local simple_sections = {
		lualine_a = { { "mode", icon = "" } },
		lualine_b = { "filetype" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	}
	local outline = {
		sections = mini_sections,
		filetypes = { "lspsagaoutline" },
	}
	local dapui_scopes = {
		sections = simple_sections,
		filetypes = { "dapui_scopes" },
	}

	local dapui_breakpoints = {
		sections = simple_sections,
		filetypes = { "dapui_breakpoints" },
	}

	local dapui_stacks = {
		sections = simple_sections,
		filetypes = { "dapui_stacks" },
	}

	local dapui_watches = {
		sections = simple_sections,
		filetypes = { "dapui_watches" },
	}

	local diffview = {
		sections = mini_sections,
		filetypes = { "DiffviewFiles" },
	}

	local function python_venv()
		local function env_cleanup(venv)
			if string.find(venv, "/") then
				local final_venv = venv
				for w in venv:gmatch("([^/]+)") do
					final_venv = w
				end
				venv = final_venv
			end
			return venv
		end

		if vim.bo.filetype == "python" then
			local venv = os.getenv("CONDA_DEFAULT_ENV")
			if venv then
				return string.format("%s", env_cleanup(venv))
			end
			venv = os.getenv("VIRTUAL_ENV")
			if venv then
				return string.format("%s", env_cleanup(venv))
			end
		end
		return ""
	end

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = custom_theme,
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode", icon = icons.misc.ManUp } },
			lualine_b = {
				{ "branch", icon = icons.cmp.Copilot },
				{
					"diff",
					symbols = { added = "  ", modified = "  ", removed = "  " },
					padding = { right = 1 },
					source = diff_source,
				},
			},
			lualine_c = {
				edit_status,
				lspsaga_symbols,
			},
			lualine_x = {
				{ escape_status, separator = "", color = { fg = colors.green } },
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = {
						error = icons.diagnostics.Error,
						warn = icons.diagnostics.Warning,
						info = icons.diagnostics.Information,
					},
					separator = "",
				},
				{
					show_lsp,
					icon = " LSP ~",
					color = { fg = colors.lavender },
					separator = "",
					fmt = trunc(145, 5, 120, false),
				},
			},
			lualine_y = {
				{
					"filetype",
					--				Uncomment to remove file typename
					colored = true, --[[icon_only = true--]]
				},
				{ python_venv },
				{ "encoding" },
				{
					"fileformat",
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "CR", -- Legacy macOS
					},
				},
			},
			lualine_z = { "progress", "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {
			"quickfix",
			"nvim-tree",
			"toggleterm",
			"fugitive",
			outline,
			diffview,
			dapui_scopes,
			dapui_breakpoints,
			dapui_stacks,
			dapui_watches,
		},
	})

	-- Properly set background color for lspsaga
	local winbar_bg = require("modules.utils").hl_to_rgb("StatusLine", true, colors.mantle)
	for _, hlGroup in pairs(require("lspsaga.lspkind").get_kind()) do
		require("modules.utils").extend_hl("LspSagaWinbar" .. hlGroup[1], { bg = winbar_bg })
	end
	require("modules.utils").extend_hl("LspSagaWinbarSep", { bg = winbar_bg })
end
