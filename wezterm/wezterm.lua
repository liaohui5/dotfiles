----------------------------------------------------------
-- github: https://github.com/wez/wezterm
-- docs  : https://wezfurlong.org/wezterm
----------------------------------------------------------
local formatTabTitle = require("format-tab-title")
local keybindings = require("keybindings")
local wezterm = require("wezterm")

-- tab 样式
wezterm.on("format-tab-title", formatTabTitle)

-- 字体样式
local fontSize = 18
local font = wezterm.font_with_fallback({
  {
    family = "Hack Nerd Font Mono",
    weight = "Regular",
    italic = false,
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- 全部设置为0禁止使用连体字符
  },
  "Maple Mono SC NF",
  "JetBrainsMono Nerd Font Mono",
})

return {
  -- colorschemes: https://wezfurlong.org/wezterm/colorschemes/index.html
  color_scheme = "Tokyo Night Moon",
  font = font,
  line_height = 1,
  font_size = fontSize,
  tab_max_width = 20,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  window_frame = { font = font, font_size = fontSize },
  enable_scroll_bar = false,
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  colors = {
    cursor_bg = "#fbbc07",
    cursor_border = "#fbbc07",
    cursor_fg = "#f8f8f8",
  },
  leader = {
    -- like tmux prefix key
    key = "a",
    mods = "CTRL",
    timeout_milliseconds = 1000,
  },
  keys = keybindings,
}
