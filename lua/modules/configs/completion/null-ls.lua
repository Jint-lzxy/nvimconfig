return function()
	local null_ls = require("null-ls")
	local mason_null_ls = require("mason-null-ls")
	local btns = null_ls.builtins

	-- Please set additional flags for the supported servers here
	-- Don't specify any config here if you are using the default one.
	local sources = {
		btns.formatting.asmfmt.with({
			extra_filetypes = { "nasm" },
		}),
		btns.formatting.clang_format.with({
			filetypes = { "c", "cpp", "objc", "objcpp", "cs", "cuda", "proto" },
			extra_args = require("completion.formatters.clang_format"),
		}),
		btns.formatting.cmake_format.with({
			filetypes = { "cmake" },
			extra_args = require("completion.formatters.cmake_format"),
		}),
		btns.formatting.prettier.with({
			filetypes = {
				"css",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"markdown",
				"scss",
				"sh",
				"typescript",
				"typescriptreact",
				"vue",
				"yaml",
			},
		}),
		btns.diagnostics.vint.with({
			filetypes = { "vim" },
			extra_args = require("completion.linters.vint"),
			-- vimls will report errors, so ignore them here
			filter = function(diagnostic)
				return diagnostic.severity ~= vim.diagnostic.severity.ERROR
			end,
		}),
	}
	null_ls.setup({
		debug = false,
		border = "rounded",
		log_level = "warn",
		update_in_insert = false,
		default_timeout = require("core.settings").format_timeout,
		sources = sources,
	})

	mason_null_ls.setup({
		ensure_installed = require("core.settings").null_ls_deps,
		automatic_installation = false,
		automatic_setup = true,
		handlers = {},
	})

	-- Setup usercmd to register/deregister available source(s)
	local function _gen_completion()
		local sources_cont = null_ls.get_source({
			filetype = vim.bo.filetype,
		})
		local completion_items = {}
		for _, server in pairs(sources_cont) do
			table.insert(completion_items, server.name)
		end
		return completion_items
	end
	vim.api.nvim_create_user_command("NullLsToggle", function(opts)
		if vim.tbl_contains(_gen_completion(), opts.args) then
			null_ls.toggle({ name = opts.args })
		else
			vim.notify(
				string.format("[Null-ls] Unable to find any registered source named [%s].", opts.args),
				vim.log.levels.ERROR,
				{ title = "Null-ls Internal Error" }
			)
		end
	end, {
		nargs = 1,
		complete = _gen_completion,
	})

	require("completion.formatting").configure_format_on_save()
end
