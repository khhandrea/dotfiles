-- ~/.config/wezterm/wezterm.lua

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Set default shell
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  -- Windows
  -- config.default_prog = {"powershell.exe"}
  config.default_prog = {"wsl.exe", "-d", "Ubuntu-22.04", "--cd", "~"}
elseif wezterm.target_triple:find("darwin") then
  -- MacOS
  config.default_prog = {"/bin/zsh", "-l"}
else
  -- Linux
  config.default_prog = {"/bin/bash", "-l"}
end

-- Windows
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 12,
  right = 4,
  top = 4,
  bottom = 12,
}

-- Theme
config.color_scheme = "Andromeda"
config.colors = {
  foreground = "e8e8e0",
  background = "2b2e28"
}

config.font = wezterm.font("D2Coding")
config.font_size = 14

config.default_cursor_style = "BlinkingBar"

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.9,
}

-- Keybindings
local act = wezterm.action
config.keys = {
  { key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
  { key = '"', mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "%", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },
}

return config
