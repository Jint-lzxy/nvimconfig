return function()
	vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "#2D2E3D" })
	vim.api.nvim_set_hl(0, "CmpPmenuSel", { bg = "#42435C" })
	vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = "#2B2C3B" })

	local icons = {
		kind = require("modules.utils.icons").get("kind"),
		type = require("modules.utils.icons").get("type"),
		cmp = require("modules.utils.icons").get("cmp"),
	}
	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	local border = function(hl)
		return {
			{ "╭", hl },
			{ "─", hl },
			{ "╮", hl },
			{ "│", hl },
			{ "╯", hl },
			{ "─", hl },
			{ "╰", hl },
			{ "│", hl },
		}
	end

	local space_separator = function(hl) -- Only have space separator between.
		return {
			{ "", hl },
			{ "", hl },
			{ "", hl },
			{ " ", hl },
			{ "", hl },
			{ "", hl },
			{ "", hl },
			{ " ", hl },
		}
	end

	local compare = require("cmp.config.compare")
	compare.lsp_scores = function(entry1, entry2)
		local diff
		if entry1.completion_item.score and entry2.completion_item.score then
			diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
		else
			diff = entry2.score - entry1.score
		end
		return (diff < 0)
	end

	local lspkind = require("lspkind")

	local cmp = require("cmp")
	cmp.setup({
		window = {
			completion = {
				-- border = border("CmpBorder"),
				winhighlight = "Normal:CmpPmenu,CursorLine:CmpPmenuSel",
				scrollbar = true,
			},
			documentation = {
				border = space_separator("CmpDocBorder"),
				winhighlight = "Normal:CmpPmenu",
			},
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				-- require("copilot_cmp.comparators").prioritize,
				-- require("copilot_cmp.comparators").score,
				-- require("cmp_tabnine.compare"),
				compare.offset,
				compare.exact,
				compare.lsp_scores,
				compare.score,
				require("cmp-under-comparator").under,
				compare.kind,
				compare.sort_text,
				compare.length,
				compare.order,
			},
		},
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 60,
				ellipsis_char = "...",
				symbol_map = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp),
				before = function(entry, vim_item)
					vim_item.menu = ({
						cmp_tabnine = "[TN]",
						copilot = "[CPLT]",
						buffer = "[BUF]",
						orgmode = "[ORG]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[LUA]",
						path = "[PATH]",
						tmux = "[TMUX]",
						luasnip = "[SNIP]",
						spell = "[SPELL]",
					})[entry.source.name]
					return vim_item
				end,
			}),
		},
		-- You can set mappings if you want
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.close(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif require("luasnip").jumpable(-1) then
					vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		-- You should specify your *installed* sources.
		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "spell" },
			{ name = "tmux" },
			{ name = "orgmode" },
			{ name = "buffer" },
			{ name = "latex_symbols" },
			-- { name = "copilot" },
			-- { name = "cmp_tabnine" },
		},
	})
end
