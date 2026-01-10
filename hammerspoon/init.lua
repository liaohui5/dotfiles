hs.loadSpoon("SpoonInstall")
hs.window.animationDuration = 0

-- please install SpoonInstall plugin-manager first
-- docs: https://www.hammerspoon.org/Spoons/SpoonInstall.html
spoon.SpoonInstall.use_syncinstall = true
spoon.SpoonInstall.repos.PaperWM = {
  url = "https://github.com/mogenson/PaperWM.spoon",
  desc = "PaperWM.spoon repository",
  branch = "release",
}
spoon.SpoonInstall:andUse("PaperWM", { repo = "PaperWM" })

----------------------------------------------------------------------
-- install and downlaod PaperWM, like niri window manager in MacOS
-- github: https://github.com/mogenson/PaperWM.spoon
----------------------------------------------------------------------
-- local PaperWM = hs.loadSpoon("PaperWM")
local PaperWM = spoon.PaperWM

PaperWM:bindHotkeys({
  -- stylua: ignore start
	-- switch focus in current desktop workspace
	focus_left  = { { "alt" }, "h" },
	focus_right = { { "alt" }, "l" },
	focus_up    = { { "alt" }, "k" },
	focus_down  = { { "alt" }, "j" },

	-- move windows around in tiled grid
	swap_left  = { { "alt", "shift" }, "h" },
	swap_right = { { "alt", "shift" }, "l" },
	swap_up    = { { "alt", "shift" }, "k" },
	swap_down  = { { "alt", "shift" }, "j" },
  -- stylua: ignore end

  -- toggle current window folat/tailing status
  toggle_floating = { { "alt", "shift" }, "f" },
  focus_floating = { { "alt", "cmd", "shift" }, "f" },

  -- increase/decrease width
  full_width = { { "alt" }, "return" },
  increase_width = { { "shift", "cmd" }, "l" },
  decrease_width = { { "shift", "cmd" }, "h" },

  -- move focused window into / out of a column
  slurp_in = { { "shift", "cmd" }, "i" },
  barf_out = { { "shift", "cmd" }, "o" },

  -- move current focused window to workspace
  move_window_1 = { { "cmd", "shift" }, "1" },
  move_window_2 = { { "cmd", "shift" }, "2" },
  move_window_3 = { { "cmd", "shift" }, "3" },
  move_window_4 = { { "cmd", "shift" }, "4" },
  move_window_5 = { { "cmd", "shift" }, "5" },
  move_window_6 = { { "cmd", "shift" }, "6" },
  move_window_7 = { { "cmd", "shift" }, "7" },
  move_window_8 = { { "cmd", "shift" }, "8" },
  move_window_9 = { { "cmd", "shift" }, "9" },

  -- switch desktop workspace
  switch_space_1 = { { "cmd" }, "1" },
  switch_space_2 = { { "cmd" }, "2" },
  switch_space_3 = { { "cmd" }, "3" },
  switch_space_4 = { { "cmd" }, "4" },
  switch_space_5 = { { "cmd" }, "5" },
  switch_space_6 = { { "cmd" }, "6" },
  switch_space_7 = { { "cmd" }, "7" },
  switch_space_8 = { { "cmd" }, "8" },
  switch_space_9 = { { "cmd" }, "9" },
})

-- window gap
PaperWM.window_gap = 5

-- disable mouse centering when switching spaces
PaperWM.center_mouse = true
PaperWM.window_ratios = { 1 / 3, 1 / 2, 2 / 3 }

-- number of fingers to detect a horizontal swipe, set to 0 to disable
PaperWM.swipe_fingers = 0

-- increase this number to make windows move farther when swiping
PaperWM.swipe_gain = 1.0

-- ignore tailing apps
local ignore_tailing_apps = {
  "System Settings",
}
for _, app_name in ipairs(ignore_tailing_apps) do
  PaperWM.window_filter:rejectApp(app_name)
end

-- resize mode
local resizeMode = hs.hotkey.modal.new({ "shift", "alt" }, "r")
local actions = PaperWM.actions.actions()
resizeMode:bind({}, "h", nil, actions.decrease_width)
resizeMode:bind({}, "l", nil, actions.increase_width)
resizeMode:bind({}, "escape", function()
  resizeMode:exit()
end)

-- don't forget start it
PaperWM:start()

----------------------------------------------------------------------
-- load status bar plugin like sketchybar, please install by manually
-- github: https://github.com/mogenson/ActiveSpace.spoon
----------------------------------------------------------------------
if hs.loadSpoon("ActiveSpace") then
  spoon.ActiveSpace:start()
end
