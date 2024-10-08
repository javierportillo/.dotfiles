local wezterm = require('wezterm')
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- [[ THEMES ]]

-- config.color_scheme = 'Vice Dark (base16)'
-- config.color_scheme = 'Black Metal (Venom) (base16)'
-- config.color_scheme = 'Atlas (base16)'
-- config.color_scheme = 'Grayscale Dark (base16)'
-- config.color_scheme = 'Rosé Pine Moon (Gogh)'
-- config.color_scheme = 'tokyonight_night'
-- config.color_scheme = 'Outrun Dark (base16)'
-- config.color_scheme = 'Gotham (terminal.sexy)'
-- config.color_scheme = 'Dark Violet (base16)'
-- config.color_scheme = 'darkmoss (base16)'
-- config.color_scheme = 'Silk Dark (base16)'
config.color_scheme = 'tokyonight_moon'

-- [[ FONTS ]]

-- config.font = wezterm.font('ComicShannsMono Nerd Font')
-- config.font = wezterm.font('CaskaydiaCove Nerd Font Mono')
-- config.font = wezterm.font('GeistMono Nerd Font Mono')
-- config.font = wezterm.font('Dank Mono')
-- config.font = wezterm.font('Monaspace Krypton')
config.font = wezterm.font('Ubuntu Mono Ligaturized')
-- config.font = wezterm.font('Lekton')
-- config.font = wezterm.font('Courier Prime')
-- config.font = wezterm.font('PT Mono')

-- config.font = wezterm.font({
--   family = 'Fira Code',
--   harfbuzz_features = { 'cv01', 'cv02', 'ss01', 'ss05', 'ss03', 'cv31', 'cv30', 'cv25', 'cv27', 'cv29' },
-- })

-- config.font = wezterm.font({
--   family = 'JetBrains Mono',
--   harfbuzz_features = { 'ss01', 'cv18' },
-- })

-- config.font = wezterm.font_with_fallback({
--   'JetBrains Mono',
--   'Symbols Nerd Font Mono',
--   'Unicode BMP Fallback SIL',
-- })

config.font_size = 12
config.use_cap_height_to_scale_fallback_fonts = true
config.freetype_load_flags = 'FORCE_AUTOHINT'

-- AlphaNum:  0123456789 abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ
-- Ligatures: => -> == === != !== <= >= /= .- []
-- Similar:   il1 oO0 dqp ;:
-- Parens:    () {} [] ({})
-- Symbols:   !@#$%^&*-_=+\|/''""``~.,
-- Fractions: 1/2 1/3

-- [[ WINDOW ]]

config.adjust_window_size_when_changing_font_size = false
config.window_decorations = 'RESIZE'
config.window_frame = {
  inactive_titlebar_bg = 'none',
  active_titlebar_bg = 'none',
  font = config.font,
  font_size = 11,
}

config.window_background_opacity = 0
config.win32_system_backdrop = 'Acrylic'
-- NOTE: Layers apply top to bottom
config.background = {
  {
    source = { Color = '#000000' },
    width = '100%',
    height = '100%',
    opacity = 0.0,
  },
  {
    source = { File = wezterm.config_dir .. '/.wezterm.png' },
    opacity = 0.0,
  },
  {
    source = {
      Gradient = {
        preset = 'Viridis',
        orientation = { Linear = { angle = -45.0 } },
      },
    },
    width = '100%',
    height = '100%',
    opacity = 0.3,
  },
  {
    source = { Color = '#04041A' },
    width = '100%',
    height = '100%',
    opacity = 0.8,
  },
}

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- [[ TABS ]]

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

local colorscheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = colorscheme.background,
      fg_color = colorscheme.ansi[2],
    },
    inactive_tab = {
      bg_color = colorscheme.background,
      fg_color = colorscheme.ansi[7],
    },
    new_tab = {
      bg_color = colorscheme.background,
      fg_color = colorscheme.ansi[7],
    },
  },
}

-- [[ CURSOR ]]

config.cursor_blink_rate = 800
config.cursor_blink_ease_in = 'Linear'
config.cursor_blink_ease_out = 'Linear'

-- [[ BEHAVIOR ]]

-- Spawn the Arch wsl instance on startup
config.default_domain = 'WSL:Arch'

config.animation_fps = 60
config.max_fps = 60
config.scrollback_lines = 5000
config.warn_about_missing_glyphs = false
config.window_close_confirmation = 'NeverPrompt'

-- [[ EVENTS ]]

wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == 'ZEN_MODE' then
    local incremental = value:find('+')
    local number_value = tonumber(value)
    local dimensions = window:get_dimensions()
    local should_full_screen = false

    if incremental ~= nil then
      while number_value > 0 do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
      should_full_screen = true
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
      should_full_screen = false
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
      should_full_screen = true
    end

    if dimensions.is_full_screen and not should_full_screen then
      window:toggle_fullscreen()
    end
    if not dimensions.is_full_screen and should_full_screen then
      window:toggle_fullscreen()
    end
  end
  window:set_config_overrides(overrides)
end)

-- [[ KEY BINDINGS ]]

config.disable_default_key_bindings = true
config.keys = {
  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo('Clipboard') },
  { key = 'F', mods = 'SHIFT|CTRL', action = act.Search('CurrentSelectionOrEmptyString') },
  { key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
  { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
  { key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
  { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
  { key = 'T', mods = 'SHIFT|CTRL', action = act.SpawnTab('CurrentPaneDomain') },
  { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom('Clipboard') },
  { key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab({ confirm = false }) },
  { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
  { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
  { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
  { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
}

config.key_tables = {
  copy_mode = {
    { key = 'Enter', mods = 'NONE', action = act.CopyMode('MoveToStartOfNextLine') },
    { key = 'Escape', mods = 'NONE', action = act.CopyMode('Close') },
    { key = 'Space', mods = 'NONE', action = act.CopyMode({ SetSelectionMode = 'Cell' }) },
    { key = '$', mods = 'SHIFT', action = act.CopyMode('MoveToEndOfLineContent') },
    { key = ',', mods = 'NONE', action = act.CopyMode('JumpReverse') },
    { key = '0', mods = 'NONE', action = act.CopyMode('MoveToStartOfLine') },
    { key = ';', mods = 'NONE', action = act.CopyMode('JumpAgain') },
    { key = 'F', mods = 'SHIFT', action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
    { key = 'G', mods = 'SHIFT', action = act.CopyMode('MoveToScrollbackBottom') },
    { key = 'H', mods = 'SHIFT', action = act.CopyMode('MoveToViewportTop') },
    { key = 'L', mods = 'SHIFT', action = act.CopyMode('MoveToViewportBottom') },
    { key = 'M', mods = 'SHIFT', action = act.CopyMode('MoveToViewportMiddle') },
    { key = 'O', mods = 'SHIFT', action = act.CopyMode('MoveToSelectionOtherEndHoriz') },
    { key = 'T', mods = 'SHIFT', action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
    { key = 'V', mods = 'SHIFT', action = act.CopyMode({ SetSelectionMode = 'Line' }) },
    { key = '^', mods = 'SHIFT', action = act.CopyMode('MoveToStartOfLineContent') },
    { key = 'b', mods = 'NONE', action = act.CopyMode('MoveBackwardWord') },
    { key = 'b', mods = 'CTRL', action = act.CopyMode('PageUp') },
    { key = 'd', mods = 'CTRL', action = act.CopyMode({ MoveByPage = 0.5 }) },
    { key = 'e', mods = 'NONE', action = act.CopyMode('MoveForwardWordEnd') },
    { key = 'f', mods = 'NONE', action = act.CopyMode({ JumpForward = { prev_char = false } }) },
    { key = 'f', mods = 'CTRL', action = act.CopyMode('PageDown') },
    { key = 'g', mods = 'NONE', action = act.CopyMode('MoveToScrollbackTop') },
    { key = 'h', mods = 'NONE', action = act.CopyMode('MoveLeft') },
    { key = 'j', mods = 'NONE', action = act.CopyMode('MoveDown') },
    { key = 'k', mods = 'NONE', action = act.CopyMode('MoveUp') },
    { key = 'l', mods = 'NONE', action = act.CopyMode('MoveRight') },
    { key = 'o', mods = 'NONE', action = act.CopyMode('MoveToSelectionOtherEnd') },
    { key = 'q', mods = 'NONE', action = act.CopyMode('Close') },
    { key = 't', mods = 'NONE', action = act.CopyMode({ JumpForward = { prev_char = true } }) },
    { key = 'u', mods = 'CTRL', action = act.CopyMode({ MoveByPage = -0.5 }) },
    { key = 'v', mods = 'NONE', action = act.CopyMode({ SetSelectionMode = 'Cell' }) },
    { key = 'v', mods = 'CTRL', action = act.CopyMode({ SetSelectionMode = 'Block' }) },
    { key = 'w', mods = 'NONE', action = act.CopyMode('MoveForwardWord') },
    {
      key = 'y',
      mods = 'NONE',
      action = act.Multiple({ { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'Close' } }),
    },
    { key = 'PageUp', mods = 'NONE', action = act.CopyMode('PageUp') },
    { key = 'PageDown', mods = 'NONE', action = act.CopyMode('PageDown') },
    { key = 'End', mods = 'NONE', action = act.CopyMode('MoveToEndOfLineContent') },
    { key = 'Home', mods = 'NONE', action = act.CopyMode('MoveToStartOfLine') },
    { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode('MoveLeft') },
    { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode('MoveBackwardWord') },
    { key = 'RightArrow', mods = 'NONE', action = act.CopyMode('MoveRight') },
    { key = 'RightArrow', mods = 'ALT', action = act.CopyMode('MoveForwardWord') },
    { key = 'UpArrow', mods = 'NONE', action = act.CopyMode('MoveUp') },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode('MoveDown') },
  },

  search_mode = {
    { key = 'Enter', mods = 'NONE', action = act.CopyMode('PriorMatch') },
    { key = 'Escape', mods = 'NONE', action = act.CopyMode('Close') },
    { key = 'n', mods = 'CTRL', action = act.CopyMode('NextMatch') },
    { key = 'p', mods = 'CTRL', action = act.CopyMode('PriorMatch') },
    { key = 'r', mods = 'CTRL', action = act.CopyMode('CycleMatchType') },
    { key = 'u', mods = 'CTRL', action = act.CopyMode('ClearPattern') },
    { key = 'PageUp', mods = 'NONE', action = act.CopyMode('PriorMatchPage') },
    { key = 'PageDown', mods = 'NONE', action = act.CopyMode('NextMatchPage') },
    { key = 'UpArrow', mods = 'NONE', action = act.CopyMode('PriorMatch') },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode('NextMatch') },
  },
}

return config
