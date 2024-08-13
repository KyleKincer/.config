-- Import the wezterm module
local wezterm = require("wezterm")
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()
local projects = require("projects")

-- (This is where our config will go)
config.color_scheme = "Solarized (dark) (terminal.sexy)"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 13.0
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.window_background_opacity = 0.8

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "p",
		mods = "LEADER",
		-- Present in to our project picker
		action = projects.choose_project(),
	},
}
-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
