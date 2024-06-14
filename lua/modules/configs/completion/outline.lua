return function()
	local icons = {
		kind = require("modules.utils.icons").get("kind", true),
		type = require("modules.utils.icons").get("type", true),
		ui = require("modules.utils.icons").get("ui", true),
	}

	require("outline").setup({
		symbol_folding = { autofold_depth = 2 },
		outline_window = {
			position = "right",
			auto_close = true,
			jump_highlight_duration = false,
			show_cursorline = "focus_in_outline",
			focus_on_open = true,
		},
		preview_window = {
			-- Experimental feature that let's you edit the source content live
			-- in the preview window.
			live = true,
		},
		keymaps = {
			up_and_jump = "<C-p>",
			down_and_jump = "<C-n>",
		},
		symbols = {
			icons = {
				-- Kind
				Class = { icon = icons.kind.Class, hl = "LspKindClass" },
				Component = { icon = icons.kind.Snippet, hl = "LspKindSnippet" },
				Constant = { icon = icons.kind.Constant, hl = "LspKindConstant" },
				Constructor = { icon = icons.kind.Constructor, hl = "LspKindConstructor" },
				Enum = { icon = icons.kind.Enum, hl = "LspKindEnum" },
				EnumMember = { icon = icons.kind.EnumMember, hl = "LspKindEnumMember" },
				Event = { icon = icons.kind.Event, hl = "LspKindEvent" },
				Field = { icon = icons.kind.Field, hl = "LspKindField" },
				File = { icon = icons.kind.File, hl = "LspKindFile" },
				Fragment = { icon = icons.kind.Fragment, hl = "LspKindKey" },
				Function = { icon = icons.kind.Function, hl = "LspKindFunction" },
				Interface = { icon = icons.kind.Interface, hl = "LspKindInterface" },
				Key = { icon = icons.kind.Keyword, hl = "LspKindKey" },
				Method = { icon = icons.kind.Method, hl = "LspKindMethod" },
				Module = { icon = icons.kind.Module, hl = "LspKindModule" },
				Namespace = { icon = icons.kind.Namespace, hl = "LspKindNamespace" },
				Operator = { icon = icons.kind.Operator, hl = "LspKindOperator" },
				Package = { icon = icons.kind.Package, hl = "LspKindPackage" },
				Property = { icon = icons.kind.Property, hl = "LspKindProperty" },
				Struct = { icon = icons.kind.Struct, hl = "LspKindStruct" },
				TypeParameter = { icon = icons.kind.TypeParameter, hl = "LspKindTypeParameter" },
				Variable = { icon = icons.kind.Variable, hl = "LspKindVariable" },
				-- Type
				Array = { icon = icons.type.Array, hl = "LspKindArray" },
				Boolean = { icon = icons.type.Boolean, hl = "LspKindBoolean" },
				Null = { icon = icons.type.Null, hl = "LspKindNull" },
				Number = { icon = icons.type.Number, hl = "LspKindNumber" },
				Object = { icon = icons.type.Object, hl = "LspKindObject" },
				String = { icon = icons.type.String, hl = "LspKindString" },
				-- ccls-specific icons
				Macro = { icon = icons.kind.Macro, hl = "LspKindConstant" },
				Parameter = { icons.kind.Parameter, hl = "LspKindParameter" },
				StaticMethod = { icons.kind.StaticMethod, hl = "LspKindStaticMethod" },
				TypeAlias = { icons.kind.TypeAlias, hl = "LspKindTypeAlias" },
			},
		},
	})
end
