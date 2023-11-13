local formatTabTitle = require("format-tab-title")
local keybindings = require("keybindings")
local wezterm = require("wezterm")
local strfmt = string.format

-- tab 样式
wezterm.on("format-tab-title", formatTabTitle)

-- 字体样式
local fontSize = 16
local font = wezterm.font_with_fallback({
  {
    family = "JetBrainsMono Nerd Font Mono",
    weight = "Light",
    italic = false,
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- 禁止使用连体字符
  },
  "OperatorMono Nerd Font Mono",
  "Hack Nerd Font Mono",
  "Source Han Sans CN",
})

return {
  -- colorschemes: https://wezfurlong.org/wezterm/colorschemes/index.html
  color_scheme = "Tokyo Night Storm",
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
    cursor_fg = "white",
  },
  leader = {
    -- like tmux prefix key
    key = "a",
    mods = "CTRL",
    timeout_milliseconds = 1000,
  },
  keys = keybindings,
}
