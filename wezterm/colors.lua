local M = {}

local wezterm = require("wezterm")

local everforest_dark_gogh = wezterm.color.get_builtin_schemes()["Everforest Dark (Gogh)"]
local everforest_light_gogh = wezterm.color.get_builtin_schemes()["Everforest Light (Gogh)"]

local better_cursor = function(color_scheme)
	color_scheme.cursor_fg = color_scheme.background
	return color_scheme
end

M.schemes = {
	["Everforest Dark"] = better_cursor(everforest_dark_gogh),
	["Everforest Light"] = better_cursor(everforest_light_gogh),
}

return M
