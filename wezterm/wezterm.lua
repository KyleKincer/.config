-- Import the wezterm module
local wezterm = require("wezterm")
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()
local projects = require("projects")

-- (This is where our config will go)
config.color_scheme = "Solarized (dark) (terminal.sexy)"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 13.0
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 25
config.colors = {
	tab_bar = {
		background = "#002b36",
		active_tab = {
			bg_color = "#586e75",
			fg_color = "#eee8d5",
		},
		inactive_tab = {
			bg_color = "#073642",
			fg_color = "#839496",
		},
		inactive_tab_hover = {
			bg_color = "#586e75",
			fg_color = "#93a1a1",
		},
		new_tab = {
			bg_color = "#073642",
			fg_color = "#93a1a1",
		},
		new_tab_hover = {
			bg_color = "#586e75",
			fg_color = "#93a1a1",
			italic = true,
		},
	},
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "p",
		mods = "LEADER",
		-- Present in to our project picker
		action = projects.choose_project(),
	},
	-- Cycle to the next workspace
	{
		key = "L",
		mods = "LEADER",
		action = wezterm.action.SwitchWorkspaceRelative(1),
	},
	-- Cycle to the previous workspace
	{
		key = "H",
		mods = "LEADER",
		action = wezterm.action.SwitchWorkspaceRelative(-1),
	},
	-- Split pane vertically
	{
		key = '"',
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Split pane horizontally
	{
		key = "%",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Move to the pane on the left
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	-- Move to the pane on the right
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	-- Move to the pane above
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	-- Move to the pane below
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	-- Close the current pane
	{
		key = "d",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	-- Resize pane up
	{
		key = "UpArrow",
		mods = "LEADER|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	-- Resize pane down
	{
		key = "DownArrow",
		mods = "LEADER|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	-- Resize pane left
	{
		key = "LeftArrow",
		mods = "LEADER|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	-- Resize pane right
	{
		key = "RightArrow",
		mods = "LEADER|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
}
-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
