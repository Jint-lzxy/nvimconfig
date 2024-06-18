local settings = {}

-- Set it to false if you want to use HTTPS to update plugins and treesitter parsers.
---@type boolean
settings["use_ssh"] = true

-- Set it to false if you want to turn off LSP Inlay Hints
---@type boolean
settings["lsp_inlayhints"] = false

-- Set it to false if there's no need to format on save.
---@type boolean
settings["format_on_save"] = true

-- Set it to false if the notification after formatting is annoying.
---@type boolean
settings["format_notify"] = true

-- Set it to true if you prefer formatting ONLY the *changed lines* as defined by your version control system.
-- NOTE: This entry will only be respected if:
--  > The buffer to be formatted is under version control (Git or Mercurial);
--  > Any of the server attached to that buffer supports |DocumentRangeFormattingProvider| server capability.
-- Otherwise Neovim would fall back to format the whole buffer, and a warning will be issued.
---@type boolean
settings["format_modifications_only"] = false

-- Set the format disabled directories here, files under these dirs won't be formatted on save.
--- NOTE: String(s) may contain regular expressions (grammar: vim). |regexp|
--- NOTE: Directories are automatically normalized. |vim.fs.normalize()|
---@type string[]
settings["format_disabled_dirs"] = {
	"~/Library/Rime",
}

-- Set it to false if diagnostics virtual text is annoying.
-- If disabled, you may browse lsp diagnostics using trouble.nvim (press `<leader>ld` to toggle it).
---@type boolean
settings["diagnostics_virtual_text"] = true

-- Set it to one of the values below if you want to change the visible severity level of lsp diagnostics.
-- Priority: `Error` > `Warning` > `Information` > `Hint`.
--  > e.g. if you set this option to `Warning`, only lsp warnings and errors will be shown.
-- NOTE: This entry only works when `diagnostics_virtual_text` is true.
---@type "ERROR"|"WARN"|"INFO"|"HINT"
settings["diagnostics_level"] = "HINT"

-- Set it to false if you don't use nvim to open big files.
---@type boolean
settings["load_big_files_faster"] = true

-- Change the colors of the global palette here.
-- Settings will complete their replacement at initialization.
-- Parameters will be automatically completed as you type.
-- Example: { sky = "#04A5E5" }
---@type palette[]
settings["palette_overwrite"] = {}

-- Set the colorscheme to use here.
-- Valid values are: `catppuccin`, `catppuccin-latte`, `catppucin-mocha`, `catppuccin-frappe`, `catppuccin-macchiato`.
---@type string
settings["colorscheme"] = "catppuccin"

-- Set it to true if your terminal has transparent background.
---@type boolean
settings["transparent_background"] = false

-- Set background color to use here.
-- Useful if you would like to use a colorscheme that has a light and dark variant like `catppuccin`.
-- Valid values are: `dark`, `light`.
---@type "dark"|"light"
settings["background"] = "dark"

-- Set the command for handling external URLs here. The executable must be available on your $PATH.
-- This entry is IGNORED on Windows and macOS, which have their default handlers builtin.
---@type string
settings["external_browser"] = "chrome-cli open"

-- Filetypes in this list will skip lsp formatting if rhs is true.
---@type table<string, boolean>
settings["formatter_block_list"] = {
	-- Example
	lua = false,
}

-- Servers in this list will skip setting formatting capabilities if rhs is true.
---@type table<string, boolean>
settings["server_formatting_block_list"] = {
	clangd = true,
	jsonls = true,
	lua_ls = true,
	neocmake = true,
	tsserver = true,
}

-- Set the language servers that will be installed during bootstrap here.
-- Check the below link for all the supported LSPs:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
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

-- Set the general-purpose servers that will be installed and configured during bootstrap here.
-- Check the below link for all supported sources:
-- in `code_actions`, `completion`, `diagnostics`, `formatting`, `hover` folders:
-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins
---@type string[]
settings["null_ls_deps"] = {
	"actionlint",
	"asmfmt",
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

-- Set the Debug Adapter Protocol (DAP) clients that will be installed and configured during bootstrap here.
-- Check the below link for all supported DAPs:
-- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
---@type string[]
settings["dap_deps"] = {
	"bash", -- Bash
	"codelldb", -- C-Family
	"delve", -- Go
	"php", -- PHP
	"python", -- Python (debugpy)
}

-- Set the Treesitter parsers that will be installed during bootstrap here.
-- Check the below link for all supported languages:
-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
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

-- Set the options for neovim's gui clients like `neovide` and `neovim-qt` here.
-- NOTE: Currently, only the following options related to the GUI are supported. Other entries will be IGNORED.
---@type { font_name: string, font_size: number }
settings["gui_config"] = {
	font_name = "JetBrainsMono Nerd Font Mono",
	font_size = 19.5,
}

-- Set the options specific to `neovide` here.
-- NOTE: You should remove the `neovide_` prefix (with trailing underscore) from all your entries below.
-- Check the below link for all supported entries:
-- https://neovide.dev/configuration.html
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
