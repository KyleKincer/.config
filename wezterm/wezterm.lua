-- Import the wezterm module
local wezterm = require("wezterm")
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)
config.color_scheme = "Solarized (dark) (terminal.sexy)"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 13.0
-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
