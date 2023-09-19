-- https://wezfurlong.org/wezterm/config/default-keys.html
local api = require("wezterm").action
return {
  {
    -- 搜索
    key = "f",
    mods = "LEADER",
    action = api.Search({ CaseSensitiveString = "" }),
  },
  {
    -- 搜索
    key = "x",
    mods = "LEADER",
    action = "ActivateCopyMode",
  },
  {
    -- 创建新的tab
    key = "c",
    mods = "LEADER",
    action = api.SpawnTab("CurrentPaneDomain"),
  },
  {
    -- 切换pane的缩放状态
    key = "z",
    mods = "LEADER",
    action = "TogglePaneZoomState",
  },
  {
    -- 上下分屏
    key = "-",
    mods = "LEADER",
    action = api.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    -- |: 左右分屏
    key = "|",
    mods = "LEADER",
    action = api.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    -- 调整分屏面板大小
    key = "LeftArrow",
    mods = "CTRL|ALT",
    action = api.AdjustPaneSize({ "Left", 1 }),
  },
  {
    -- 调整分屏面板大小
    key = "RightArrow",
    mods = "CTRL|ALT",
    action = api.AdjustPaneSize({ "Right", 1 }),
  },
  {
    -- 调整分屏面板大小
    key = "UpArrow",
    mods = "CTRL|ALT",
    action = api.AdjustPaneSize({ "Up", 1 }),
  },
  {
    -- 调整分屏面板大小
    key = "DownArrow",
    mods = "CTRL|ALT",
    action = api.AdjustPaneSize({ "Down", 1 }),
  },
  {
    -- 在面板之间移动光标
    key = "h",
    mods = "LEADER",
    action = api.ActivatePaneDirection("Left"),
  },
  {
    -- 在面板之间移动光标
    key = "l",
    mods = "LEADER",
    action = api.ActivatePaneDirection("Right"),
  },
  {
    -- 在面板之间移动光标
    key = "k",
    mods = "LEADER",
    action = api.ActivatePaneDirection("Up"),
  },
  {
    -- s 在面板之间移动光标
    key = "j",
    mods = "LEADER",
    action = api.ActivatePaneDirection("Down"),
  },

  -- 切换到指定的那个 tab
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
    -- 切换到前一个 tab
    key = "h",
    mods = "CTRL|ALT",
    action = api.ActivateTabRelative(-1),
  },
  {
    -- 切换到后一个 tab
    key = "l",
    mods = "CTRL|ALT",
    action = api.ActivateTabRelative(1),
  },
}
