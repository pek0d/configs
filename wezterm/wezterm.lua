-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- autoreload config
config.automatically_reload_config = true
-- Window options
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.89
config.initial_cols = 115
config.initial_rows = 35
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- Bell
config.audible_bell = "SystemBeep"
-- For example, changing the color scheme:
config.color_scheme = "Apple System Colors"
-- Tab options
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 20
-- Font config
config.font = wezterm.font("RobotoMono Nerd Font Mono")
config.font_size = 12.2
-- exit
config.exit_behavior_messaging = "None"
config.window_close_confirmation = "NeverPrompt"
-- and finally, return the configuration to wezterm
return config
