----------------------------------------------------------
-- github: https://github.com/wez/wezterm
-- docs  : https://wezfurlong.org/wezterm
----------------------------------------------------------
local keybindings = require("keybindings")
local wezterm = require("wezterm")
require("tabline").setup()

-- font styles
-- https://github.com/ryanoasis/nerd-fonts
local fontSize = 18
local font = wezterm.font_with_fallback({
  {
    family = "Hack Nerd Font Mono",
    weight = "Regular",
    italic = false,
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  },
  "Maple Mono SC NF",
  "JetBrainsMono Nerd Font Mono",
})

return {
  -- colorschemes: https://wezfurlong.org/wezterm/colorschemes/index.html
  -- color_scheme = "Tokyo Night Moon",
  color_scheme = "Monokai (base16)",
  font = font,
  line_height = 1,
  font_size = fontSize,
  tab_max_width = 30,
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
