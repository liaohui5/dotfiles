-- https://wezfurlong.org/wezterm/config/default-keys.html
local api = require("wezterm").action
return {
  {
    key = "f",
    mods = "LEADER",
    action = api.Search({ CaseSensitiveString = "" }),
  },
  {
    key = "x",
    mods = "LEADER",
    action = "ActivateCopyMode",
  },
  {
    key = "c",
    mods = "LEADER",
    action = api.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "z",
    mods = "LEADER",
    action = "TogglePaneZoomState",
  },
  {
    key = "-",
    mods = "LEADER",
    action = api.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "|",
    mods = "LEADER",
    action = api.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "LeftArrow",
    mods = "CTRL|ALT",
    action = api.AdjustPaneSize({ "Left", 1 }),
  },
  {
    key = "RightArrow",
    mods = "CTRL|ALT",
    action = api.AdjustPaneSize({ "Right", 1 }),
  },
  {
    key = "UpArrow",
    mods = "CTRL|ALT",
    action = api.AdjustPaneSize({ "Up", 1 }),
  },
  {
    key = "DownArrow",
    mods = "CTRL|ALT",
    action = api.AdjustPaneSize({ "Down", 1 }),
  },
  {
    key = "h",
    mods = "LEADER",
    action = api.ActivatePaneDirection("Left"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = api.ActivatePaneDirection("Right"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = api.ActivatePaneDirection("Up"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = api.ActivatePaneDirection("Down"),
  },

  { key = "1", mods = "LEADER", action = api.ActivateTab(0) },
  { key = "2", mods = "LEADER", action = api.ActivateTab(1) },
  { key = "3", mods = "LEADER", action = api.ActivateTab(2) },
  { key = "4", mods = "LEADER", action = api.ActivateTab(3) },
  { key = "5", mods = "LEADER", action = api.ActivateTab(4) },
  { key = "6", mods = "LEADER", action = api.ActivateTab(5) },
  { key = "7", mods = "LEADER", action = api.ActivateTab(6) },
  { key = "8", mods = "LEADER", action = api.ActivateTab(7) },
  { key = "9", mods = "LEADER", action = api.ActivateTab(-1) },
  {
    key = "h",
    mods = "CTRL|ALT",
    action = api.ActivateTabRelative(-1),
  },
  {
    key = "l",
    mods = "CTRL|ALT",
    action = api.ActivateTabRelative(1),
  },
}
