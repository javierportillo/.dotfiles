local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'tokyonight'
config.colors = {
  background = '#000015'
}

-- config.font = wezterm.font 'ComicShannsMono Nerd Font'
-- config.font = wezterm.font 'CaskaydiaCove Nerd Font Mono'
-- config.font = wezterm.font 'FiraCode Nerd Font Mono'
-- config.font = wezterm.font 'GeistMono Nerd Font Mono'
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.8

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Spawn the Arch wsl instance on startup
config.default_domain = 'WSL:Arch'

return config
