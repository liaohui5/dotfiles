return {
  setup = function(keybindings)
    local wezterm = require("wezterm")
    local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
    local keys = keybindings or {}

    table.insert(keys, {
      key = "n",
      mods = "LEADER",
      action = workspace_switcher.switch_workspace(),
    })

    table.insert(keys, {
      key = "p",
      mods = "LEADER",
      action = workspace_switcher.switch_to_prev_workspace(),
    })

    wezterm.on("smart_workspace_switcher.workspace_switcher.chosen", function(window, workspace)
      local gui_win = window:gui_window()
      local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
      gui_win:set_right_status(wezterm.format({
        { Foreground = { Color = "green" } },
        { Text = base_path .. "  " },
      }))
    end)

    wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, workspace)
      local gui_win = window:gui_window()
      local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
      gui_win:set_right_status(wezterm.format({
        { Foreground = { Color = "green" } },
        { Text = base_path .. "  " },
      }))
    end)
  end,
}
