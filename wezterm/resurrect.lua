----------------------------------------------------------
--- session management plugin
--- github: https://github.com/MLFlexer/resurrect.wezterm
local wezterm = require("wezterm")

return {
  setup = function(keybindings)
    local keys = keybindings or {}
    local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
    resurrect.state_manager.periodic_save({
      interval_seconds = 15 * 60,
      save_workspaces = true,
      save_windows = true,
      save_tabs = true,
    })

    --- save session
    table.insert(keys, {
      key = "s",
      -- mods = "CTRL|ALT",
      mods = "LEADER",
      action = wezterm.action_callback(function(win, pane)
        resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
        resurrect.tab_state.save_tab_action()
        resurrect.window_state.save_window_action()
      end),
    })

    -- restore session
    table.insert(keys, {
      key = "r",
      mods = "LEADER",
      action = wezterm.action_callback(function(win, pane)
        resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
          local type = string.match(id, "^([^/]+)") -- match before '/'
          id = string.match(id, "([^/]+)$") -- match after '/'
          id = string.match(id, "(.+)%..+$") -- remove file extention
          local opts = {
            relative = true,
            restore_text = true,
            on_pane_restore = resurrect.tab_state.default_on_pane_restore,
          }
          if type == "workspace" then
            local state = resurrect.state_manager.load_state(id, "workspace")
            resurrect.workspace_state.restore_workspace(state, opts)
          elseif type == "window" then
            local state = resurrect.state_manager.load_state(id, "window")
            resurrect.window_state.restore_window(pane:window(), state, opts)
          elseif type == "tab" then
            local state = resurrect.state_manager.load_state(id, "tab")
            resurrect.tab_state.restore_tab(pane:tab(), state, opts)
          end
        end)
      end),
    })

    -- delete session
    table.insert(keys, {
      key = "x",
      mods = "LEADER",
      action = wezterm.action_callback(function(win, pane)
        local options = {
          title = "Delete State",
          description = "Select session to delete and press Enter = accept, Esc = cancel, / = filter",
          fuzzy_description = "Search session to delete: ",
          is_fuzzy = true,
        }
        resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id)
          resurrect.state_manager.delete_state(id)
        end, options)
      end),
    })
  end,
}
