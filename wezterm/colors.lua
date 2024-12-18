local M = {}

local wezterm = require("wezterm")

local everforest_dark = wezterm.color.get_builtin_schemes()["Everforest Dark Hard (Gogh)"]
local everforest_light = wezterm.color.get_builtin_schemes()["Everforest Light Hard (Gogh)"]
local catppuccin_light = wezterm.color.get_builtin_schemes()["Catppuccin Latte"]
local catppuccin_dark = wezterm.color.get_builtin_schemes()["Catppuccin Frappe"]

local better_cursor = function(color_scheme)
	color_scheme.cursor_fg = color_scheme.background
	return color_scheme
end

M.schemes = {
	["JD Dark"] = everforest_dark,
	["JD Light"] = everforest_light,
}

return M
