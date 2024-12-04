local scheme_for_appearance = function(appearance)
	if appearance:find("Dark") then
		return "Everforest Dark"
	else
		return "Everforest Light"
	end
end

local opacity_for_appearance = function(appearance)
	if appearance:find("Dark") then
		return 1
	else
		return 1
	end
end

local colors = require("colors")
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local appearance = wezterm.gui.get_appearance()

config.font_size = 15.0
config.cell_width = 1
config.line_height = 1.1

config.front_end = "WebGpu"

config.color_schemes = colors.schemes

config.color_scheme = scheme_for_appearance(appearance)

config.window_background_opacity = opacity_for_appearance(appearance)
config.macos_window_background_blur = 128

config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_decorations = "RESIZE"

config.warn_about_missing_glyphs = false

return config
