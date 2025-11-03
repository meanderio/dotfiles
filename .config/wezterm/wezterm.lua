local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font(
  "JetBrainsMono Nerd Font Mono",
  {
    weight="Medium",
    stretch="Normal",
    style="Normal"
  }
)
config.window_padding = {
  left = 4.0,
  right = 4.0,
  top = 2.0,
  bottom = 2.0
}
config.font_size = 14.0
config.use_fancy_tab_bar = false
config.default_cursor_style = "BlinkingUnderline"
config.tab_bar_at_bottom = true
--config.window_decorations = "RESIZE"

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
  options = {
    theme = "Catppuccin Mocha"
  }
})

config.leader = { key = 'i', mods = 'CTRL' }

config.keys = {
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 'h',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivatePaneDirection('Left')
  },
  {
    key = 'j',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivatePaneDirection('Down')
  },
  {
    key = 'k',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivatePaneDirection('Up')
  },
  {
    key = 'l',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivatePaneDirection('Right')
  },
  {
    key = 'd',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical
  },
  {
    key = 'f',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal
  },
}

return config

