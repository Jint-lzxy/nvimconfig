local formatting = require("completion.formatting")

local nvim_lsp = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
require("lspconfig.ui.windows").default_options.border = "single"

local icons = {
	ui = require("modules.utils.icons").get("ui", true),
	misc = require("modules.utils.icons").get("misc", true),
}

mason.setup({
	ui = {
		border = "single",
		icons = {
			package_pending = icons.ui.Modified_alt,
			package_installed = icons.ui.Check,
			package_uninstalled = icons.misc.Ghost,
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = require("core.settings").lsp_deps,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local opts = {
	on_attach = function()
		require("lsp_signature").on_attach({
			bind = true,
			use_lspsaga = false,
			floating_window = true,
			fix_pos = true,
			hint_enable = true,
			hi_parameter = "Search",
			handler_opts = {
				border = "single",
			},
		})
	end,
	capabilities = capabilities,
}

---A handler to setup all servers defined under `completion/servers/*.lua`
---@param lsp_name string
local function mason_handler(lsp_name)
	---Check whether this server has custom configs
	---@return boolean
	local function check_config()
		local cfg_path = require("core.global").vim_path .. "/lua/modules/configs/completion/servers"
		local list = {}
		local servers_list = vim.split(vim.fn.glob(cfg_path .. "/*.lua"), "\n")
		if type(servers_list) == "table" then
			for _, s in ipairs(servers_list) do
				list[#list + 1] = s:sub(#cfg_path + 2, -5)
			end
		end
		return vim.tbl_contains(list, lsp_name)
	end

	if not check_config() then
		-- Default to use factory config for server(s) that doesn't include a spec
		nvim_lsp[lsp_name].setup(opts)
		return
	end

	local custom_handler = require("completion.servers." .. lsp_name)
	if type(custom_handler) == "function" then
		--- Case where language server requires its own setup
		--- Make sure to call require("lspconfig")[lsp_name].setup() in the function
		--- See `clangd.lua` for example.
		custom_handler(opts)
	elseif type(custom_handler) == "table" then
		nvim_lsp[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
	else
		vim.notify(
			string.format(
				"Failed to setup [%s].\n\nServer definition under `completion/servers` must return\neither a fun(opts) or a table (got '%s' instead)",
				lsp_name,
				type(custom_handler)
			),
			vim.log.levels.ERROR,
			{ title = "nvim-lspconfig" }
		)
	end
end

mason_lspconfig.setup_handlers({ mason_handler })

-- Setup lsps that are not supported by `mason.nvim` but supported by `nvim-lspconfig` here.
if vim.fn.executable("sourcekit-lsp") then
	local _opts = require("completion.servers.sourcekit")
	local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
	nvim_lsp.sourcekit.setup(final_opts)
end

local efmls = require("efmls-configs")

-- Init `efm-langserver` here.

efmls.init({
	on_attach = opts.on_attach,
	capabilities = capabilities,
	init_options = { documentFormatting = true, codeAction = true },
})

-- Require `efmls-configs-nvim`'s config here

local vint = require("efmls-configs.linters.vint")
local eslint = require("efmls-configs.linters.eslint")
local flake8 = require("efmls-configs.linters.flake8")

local black = require("efmls-configs.formatters.black")
local stylua = require("efmls-configs.formatters.stylua")
local prettier = require("efmls-configs.formatters.prettier")
local shfmt = require("efmls-configs.formatters.shfmt")

-- Add your own config for formatter and linter here

local nasmfmt = require("completion.efm.formatters.nasmfmt")
-- local clangtidy = require("completion.efm.formatters.clangtidy")
local clangfmt = require("completion.efm.formatters.clangfmt")

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
	asm = { formatter = nasmfmt },
	vim = { formatter = vint },
	lua = { formatter = stylua },
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
	sh = { formatter = shfmt },
	markdown = { formatter = prettier },
	-- rust = {formatter = rustfmt},
})

formatting.configure_format_on_save()
