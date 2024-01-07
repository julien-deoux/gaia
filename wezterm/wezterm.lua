local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font({
	family = "FiraCode Nerd Font Mono",
	harfbuzz_features = { "onum" },
})
config.font_size = 15.0
config.cell_width = 1.05
config.line_height = 1.1

local scheme_for_appearance = function(appearance)
	if appearance:find("Dark") then
		return "Everforest Dark (Gogh)"
	else
		return "Everforest Light (Gogh)"
	end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_decorations = "RESIZE"

return config
