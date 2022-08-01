local formatting = require("modules.completion.formatting")

vim.cmd([[packadd lsp_signature.nvim]])
vim.cmd([[packadd lspsaga.nvim]])
vim.cmd([[packadd cmp-nvim-lsp]])
vim.cmd([[packadd aerial.nvim]])
vim.cmd([[packadd vim-illuminate]])

local nvim_lsp = require("lspconfig")
local saga = require("lspsaga")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup({})

mason_lsp.setup({
	ensure_installed = {
		"bash-language-server",
		"efm",
		"lua-language-server",
		"clangd",
		"gopls",
		"pyright",
	},
})

-- Override diagnostics symbol

saga.init_lsp_saga({
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local function custom_attach(client)
	require("lsp_signature").on_attach({
		bind = true,
		use_lspsaga = false,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hi_parameter = "Search",
		handler_opts = { "double" },
	})
	require("aerial").on_attach(client)
	require("illuminate").on_attach(client)
end

local function switch_source_header_splitcmd(bufnr, splitcmd)
	bufnr = nvim_lsp.util.validate_bufnr(bufnr)
	local clangd_client = nvim_lsp.util.get_active_client_by_name(bufnr, "clangd")
	local params = { uri = vim.uri_from_bufnr(bufnr) }
	if clangd_client then
		clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
			if err then
				error(tostring(err))
			end
			if not result then
				print("Corresponding file can’t be determined")
				return
			end
			vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
		end)
	else
		print("method textDocument/switchSourceHeader is not supported by any servers active on the current buffer")
	end
end

-- Override server settings here

for _, server in ipairs(mason_lsp.get_installed_servers()) do
	if server == "gopls" then
		nvim_lsp.gopls.setup({
			on_attach = custom_attach,
			flags = { debounce_text_changes = 500 },
			capabilities = capabilities,
			cmd = { "gopls", "-remote=auto" },
			settings = {
				gopls = {
					usePlaceholders = true,
					analyses = {
						nilness = true,
						shadow = true,
						unusedparams = true,
						unusewrites = true,
					},
				},
			},
		})
	elseif server == "sumneko_lua" then
		nvim_lsp.sumneko_lua.setup({
			capabilities = capabilities,
			on_attach = custom_attach,
			settings = {
				Lua = {
					runtime = { version = { "LuaJIT" } },
					diagnostics = { globals = { "vim", "packer_plugins" } },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
					telemetry = { enable = false },
				},
			},
		})
	elseif server == "clangd" then
		local copy_capabilities = capabilities
		copy_capabilities.offsetEncoding = { "utf-16" }
		nvim_lsp.clangd.setup({
			capabilities = copy_capabilities,
			single_file_support = true,
			on_attach = custom_attach,
			args = {
				"-Wall",
				"--background-index",
				"-std=c++17",
				"--pch-storage=memory",
				"--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
				"--clang-tidy",
				"--all-scopes-completion",
				"--cross-file-rename",
				"--completion-style=detailed",
				"--header-insertion-decorators",
				"--header-insertion=iwyu",
				"--suggest-missing-includes",
			},
			commands = {
				ClangdSwitchSourceHeader = {
					function()
						switch_source_header_splitcmd(0, "edit")
					end,
					description = "Open source/header in current buffer",
				},
				ClangdSwitchSourceHeaderVSplit = {
					function()
						switch_source_header_splitcmd(0, "vsplit")
					end,
					description = "Open source/header in a new vsplit",
				},
				ClangdSwitchSourceHeaderSplit = {
					function()
						switch_source_header_splitcmd(0, "split")
					end,
					description = "Open source/header in a new split",
				},
			},
		})
	elseif server == "jsonls" then
		nvim_lsp.jsonls.setup({
			flags = { debounce_text_changes = 500 },
			capabilities = capabilities,
			on_attach = custom_attach,
			settings = {
				json = {
					-- Schemas https://www.schemastore.org
					schemas = {
						{
							fileMatch = { "package.json" },
							url = "https://json.schemastore.org/package.json",
						},
						{
							fileMatch = { "tsconfig*.json" },
							url = "https://json.schemastore.org/tsconfig.json",
						},
						{
							fileMatch = {
								".prettierrc",
								".prettierrc.json",
								"prettier.config.json",
							},
							url = "https://json.schemastore.org/prettierrc.json",
						},
						{
							fileMatch = { ".eslintrc", ".eslintrc.json" },
							url = "https://json.schemastore.org/eslintrc.json",
						},
						{
							fileMatch = {
								".babelrc",
								".babelrc.json",
								"babel.config.json",
							},
							url = "https://json.schemastore.org/babelrc.json",
						},
						{
							fileMatch = { "lerna.json" },
							url = "https://json.schemastore.org/lerna.json",
						},
						{
							fileMatch = {
								".stylelintrc",
								".stylelintrc.json",
								"stylelint.config.json",
							},
							url = "http://json.schemastore.org/stylelintrc.json",
						},
						{
							fileMatch = { "/.github/workflows/*" },
							url = "https://json.schemastore.org/github-workflow.json",
						},
					},
				},
			},
		})
	else
		nvim_lsp[server].setup({
			capabilities = capabilities,
			on_attach = custom_attach,
		})
	end
end

-- https://github.com/vscode-langservers/vscode-html-languageserver-bin

nvim_lsp.html.setup({
	cmd = { "html-languageserver", "--stdio" },
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = { css = true, javascript = true },
	},
	settings = {},
	single_file_support = true,
	flags = { debounce_text_changes = 500 },
	capabilities = capabilities,
	on_attach = custom_attach,
})

local efmls = require("efmls-configs")

-- Init `efm-langserver` here.

efmls.init({
	on_attach = custom_attach,
	capabilities = capabilities,
	init_options = { documentFormatting = true, codeAction = true },
})

-- Require `efmls-configs-nvim`'s config here

local vint = require("efmls-configs.linters.vint")
--[[
local clangtidy = {
	prefix = "clang-tidy",
	lintStdin = false,
	lintCommand = string.format(
		"%s -extra-arg=-I/Library/Developer/CommandLineTools/usr/include/c++/v1 ${INPUT}",
		"/usr/local/bin/clang-tidy"
	),
	lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
	rootMarkers = {},
}
--]]
local eslint = require("efmls-configs.linters.eslint")
local flake8 = require("efmls-configs.linters.flake8")
local shellcheck = require("efmls-configs.linters.shellcheck")

local black = require("efmls-configs.formatters.black")
local luafmt = require("efmls-configs.formatters.stylua")
local clangfmt = {
	formatCommand = "clang-format -style='{ \z
            BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: ForIndentation, \z
            NamespaceIndentation: All, AccessModifierOffset: -4, \z
            AlignArrayOfStructures: Right, AlignEscapedNewlines: Left, \z
            AlignTrailingComments: true, AllowShortBlocksOnASingleLine: Always, \z
            AllowShortCaseLabelsOnASingleLine: true, AllowShortEnumsOnASingleLine: true, \z
            AllowShortFunctionsOnASingleLine: Inline, AllowShortLoopsOnASingleLine: true, \z
            BitFieldColonSpacing: Both, BreakBeforeBraces: Custom, BraceWrapping: {\z
            AfterCaseLabel: false, AfterClass: false, AfterEnum: false, AfterFunction: true, \z
            AfterNamespace: true, AfterStruct: true, AfterUnion: true, AfterExternBlock: false, \z
            BeforeCatch: true, BeforeElse: false, BeforeLambdaBody: false, BeforeWhile: false, \z
            SplitEmptyFunction: false, SplitEmptyRecord: false, SplitEmptyNamespace: false}, \z
            FixNamespaceComments: true, ShortNamespaceLines: 3, ColumnLimit: 100, \z
            BreakBeforeTernaryOperators: true, BreakConstructorInitializers: BeforeColon, \z
            BreakInheritanceList: BeforeColon, BreakStringLiterals: true, \z
            Cpp11BracedListStyle: true, EmptyLineAfterAccessModifier: Leave, \z
            IncludeBlocks: Regroup, IndentPPDirectives: BeforeHash, \z
            IndentWrappedFunctionNames: true, PointerAlignment: Left, \z
            ReferenceAlignment: Pointer, SeparateDefinitionBlocks: Always, \z
            SortIncludes: CaseSensitive, SortUsingDeclarations: true, \z
            SpaceAfterCStyleCast: true, SpaceBeforeCaseColon: false, \z
            AllowShortLambdasOnASingleLine: All, PackConstructorInitializers: Never, \z
            SpaceBeforeRangeBasedForLoopColon: false, AlignConsecutiveAssignments: Consecutive, \z
            AlwaysBreakTemplateDeclarations: Yes, IndentCaseLabels: true, \z
            SpaceBeforeSquareBrackets: false, SpaceBeforeRangeBasedForLoopColon: true, \z
            EmptyLineBeforeAccessModifier: Leave, Standard: Auto \z
        }'",
	formatStdin = true,
}
local prettier = require("efmls-configs.formatters.prettier")
local shfmt = require("efmls-configs.formatters.shfmt")

-- Add your own config for formatter and linter here

-- local rustfmt = require("modules.completion.efm.formatters.rustfmt")

-- Override default config here

flake8 = vim.tbl_extend("force", flake8, {
	prefix = "flake8: max-line-length=160, ignore F403 and F405",
	lintStdin = true,
	lintIgnoreExitCode = true,
	lintFormats = { "%f:%l:%c: %t%n%n%n %m" },
	lintCommand = "flake8 --max-line-length 160 --extend-ignore F403,F405 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
})

-- Setup formatter and linter for efmls here

efmls.setup({
	vim = { formatter = vint },
	lua = { formatter = luafmt },
	c = { formatter = clangfmt },
	cpp = { formatter = clangfmt },
	python = { formatter = black },
	vue = { formatter = prettier },
	typescript = { formatter = prettier, linter = eslint },
	javascript = { formatter = prettier, linter = eslint },
	json = { formatter = prettier, linter = eslint },
	typescriptreact = { formatter = prettier, linter = eslint },
	javascriptreact = { formatter = prettier, linter = eslint },
	yaml = { formatter = prettier },
	ruby = { formatter = prettier },
	html = { formatter = prettier },
	css = { formatter = prettier },
	scss = { formatter = prettier },
	sh = { formatter = shfmt, linter = shellcheck },
	markdown = { formatter = prettier },
	-- rust = {formatter = rustfmt},
})

formatting.configure_format_on_save()
