local wezterm = require('wezterm')
local mux = wezterm.mux

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font('JetBrainsMonoNL Nerd Font Mono', { weight = 'Medium' })
config.font_size = 11.5

config.audible_bell = 'Disabled'
config.enable_tab_bar = true
config.window_decorations = 'RESIZE'
config.window_padding = {
  left = 24,
  right = 0,
  top = 1,
}

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
