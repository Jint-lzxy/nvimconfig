local settings = {}

-- Set it to false if you want to use https to update plugins and treesitter parsers.
---@type boolean
settings["use_ssh"] = true

-- Set it to false if there are no need to format on save.
---@type boolean
settings["format_on_save"] = true

-- Set the format disabled directories here, files under these dirs won't be formatted on save.
---@type string[]
settings["format_disabled_dirs"] = {}

-- Set it to false if you don't use nvim to open big files.
---@type boolean
settings["load_big_files_faster"] = true

-- Change the colors of the global palette here.
-- Settings will complete their replacement at initialization.
-- Parameters will be automatically completed as you type.
-- Example: { sky = "#04A5E5" }
---@type palette
settings["palette_overwrite"] = {}

-- Set the colorscheme to use here.
-- Valid values are: `catppuccin`, `edge`, `nord`.
---@type string
settings["colorscheme"] = "catppuccin"

-- Set background color to use here.
-- Useful if you would like to use a colorscheme that has a light and dark variant like `edge`.
-- Valid values are: `dark`, `light`.
---@type "dark"|"light"
settings["background"] = "dark"

return settings
