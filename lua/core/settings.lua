local settings = {}

-- Set to false to use HTTPS instead of SSH for updating plugins and Treesitter parsers.
---@type boolean
settings["use_ssh"] = true

-- Set to false if you don't use Copilot.
---@type boolean
settings["use_copilot"] = false

-- Set to false if you don't want to format on save.
---@type boolean
settings["format_on_save"] = true

-- Format timeout in milliseconds.
---@type number
settings["format_timeout"] = 1000

-- Set to false to disable notifications after formatting.
---@type boolean
settings["format_notify"] = true

-- Set to true to format ONLY *modified lines* based on version control.
-- NOTE: This is only respected if:
--  > The buffer is under version control (Git or Mercurial);
--  > At least one attached server supports the |DocumentRangeFormattingProvider| capability.
-- Otherwise, Neovim will fall back to formatting the entire buffer and display a warning.
---@type boolean
settings["format_modifications_only"] = false

-- Filetypes listed here will skip LSP formatting if the value is true.
---@type table<string, boolean>
settings["formatter_block_list"] = {
	-- Example
	lua = false,
}

-- LSP servers listed here will skip setting formatting capabilities if the value is true.
---@type table<string, boolean>
settings["server_formatting_block_list"] = {
	bashls = true,
	clangd = true,
	jsonls = true,
	lua_ls = true,
	neocmake = true,
	ts_ls = true,
}

-- Files under these directories will not be formatted on save.
-- NOTE: Strings can include Vim-style regular expressions. |regexp|
-- NOTE: Directories are automatically normalized via |vim.fs.normalize()|.
---@type string[]
settings["format_disabled_dirs"] = {
	"~/Library/Rime",
}

-- Set to false to disable virtual lines for diagnostics.
-- You can still view diagnostics using trouble.nvim (`<leader>ld`).
---@type boolean
settings["diagnostics_virtual_lines"] = true

-- Set the minimum severity level of diagnostics to be displayed.
-- Priority order: `Error` > `Warning` > `Information` > `Hint`.
-- NOTE: This is only effective when `diagnostics_virtual_text` is true.
---@type "ERROR"|"WARN"|"INFO"|"HINT"
settings["diagnostics_level"] = "HINT"

-- Set to false if you don't open large files in Neovim.
---@type boolean
settings["load_big_files_faster"] = true

-- Customize global palette colors here.
-- These settings are applied during initialization.
-- Example: { sky = "#04A5E5" }
---@type palette[]
settings["palette_overwrite"] = {}

-- Set the desired colorscheme.
-- Valid options: `catppuccin`, `catppuccin-latte`, `catppuccin-mocha`, `catppuccin-frappe`, `catppuccin-macchiato`.
---@type string
settings["colorscheme"] = "catppuccin"

-- Set to true if your terminal supports a transparent background.
---@type boolean
settings["transparent_background"] = false

-- Set the background variant for the colorscheme.
-- Useful for themes that support both light and dark modes.
-- Valid values: `dark`, `light`.
---@type "dark"|"light"
settings["background"] = "dark"

-- Set the command used to open external URLs.
-- NOTE: This is ignored on Windows and macOS, which use default system handlers.
---@type string
settings["external_browser"] = "chrome-cli open"

-- Set to false to disable LSP inlay hints.
---@type boolean
settings["lsp_inlayhints"] = false

-- List the language servers to install during bootstrap.
-- See supported servers: https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/configs
---@type string[]
settings["lsp_deps"] = {
	"asm_lsp",
	"awk_ls",
	"bashls",
	"clangd",
	"eslint",
	"gopls",
	"html",
	"jdtls",
	"jsonls",
	"ltex",
	"lua_ls",
	"marksman",
	"neocmake",
	"pylsp",
	"rust_analyzer",
	"sorbet",
	"taplo",
	"vimls",
	"yamlls",
}

-- List of general-purpose tools to install with `null-ls`.
-- Supported sources: https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins
---@type string[]
settings["null_ls_deps"] = {
	"actionlint",
	"asmfmt",
	"checkmake",
	"clang_format",
	"cmake_format",
	"editorconfig-checker",
	"gitlint",
	"gofumpt",
	"goimports",
	"prettier",
	"shfmt",
	"stylua",
	"vint",
	"yamlfmt",
}

-- List the DAP clients to install and configure during bootstrap.
-- Supported DAPs: https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
---@type string[]
settings["dap_deps"] = {
	"bash", -- Bash
	"codelldb", -- C-Family
	"delve", -- Go
	"php", -- PHP
	"python", -- Python (debugpy)
}

-- Treesitter parsers to install during bootstrap.
-- Supported languages: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
---@type string[]
settings["treesitter_deps"] = {
	"asm",
	"bash",
	"bibtex",
	"c",
	"cmake",
	"cpp",
	"c_sharp",
	"css",
	"dart",
	"diff",
	"disassembly",
	"dockerfile",
	"doxygen",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitignore",
	"go",
	"gomod",
	"gosum",
	"gpg",
	"hlsl",
	"html",
	"java",
	"javascript",
	"json",
	"latex",
	"linkerscript",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"nasm",
	"nix",
	"objc",
	"objdump",
	"perl",
	"php",
	"python",
	"query",
	"readline",
	"ruby",
	"rust",
	"ssh_config",
	"swift",
	"typescript",
	"vim",
	"vimdoc",
	"vue",
	"xml",
	"yaml",
}

-- Options for Neovim GUI clients like `neovide` and `neovim-qt`.
-- Only supported GUI options will be applied.
---@type { font_name: string, font_size: number }
settings["gui_config"] = {
	font_name = "JetBrainsMono Nerd Font Mono",
	font_size = 19.5,
}

-- Configuration specific to Neovide.
-- Remove the `neovide_` prefix when setting keys.
-- Supported keys: https://neovide.dev/configuration.html
---@type table<string, boolean|number|string>
settings["neovide_config"] = {
	no_idle = false,
	input_ime = true,
	fullscreen = true,
	padding_left = 8,
	confirm_quit = true,
	cursor_vfx_mode = "torpedo",
	cursor_trail_size = 0.05,
	cursor_antialiasing = true,
	hide_mouse_when_typing = true,
	input_macos_alt_is_meta = false,
	cursor_animation_length = 0.03,
	cursor_vfx_particle_speed = 20.0,
	cursor_vfx_particle_density = 5.0,
}

return settings
