local wezterm = require("wezterm")
local action = wezterm.action
local mux = wezterm.mux

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "Medium" })
config.font_size = 11

config.audible_bell = "Disabled"
config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
}

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.disable_default_key_bindings = true

config.keys = {
	{
		key = "s",
		mods = "CTRL",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "CTRL",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "l",
		mods = "SUPER",
		action = action.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "SUPER",
		action = action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "SUPER",
		action = action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "SUPER",
		action = action.ActivatePaneDirection("Up"),
	},
	{
		key = "w",
		mods = "SUPER",
		action = action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "[",
		mods = "SUPER",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "]",
		mods = "SUPER",
		action = action.ActivateTabRelative(1),
	},
	{
		key = "t",
		mods = "CTRL",
		action = action.SpawnTab("DefaultDomain"),
	},
	{
		key = "n",
		mods = "CTRL",
		action = action.SpawnWindow,
	},
	{
		key = "q",
		mods = "CTRL",
		action = action.QuitApplication,
	},
}

return config
