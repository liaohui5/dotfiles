local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

return {
  setup = function()
    tabline.setup({
      options = {
        theme = "Tokyo Night Moon",
        icons_enabled = true,
        tabs_enabled = true,
        theme_overrides = {
          tab = {
            active = { fg = "#f6f6f6", bg = "#1a73e8" },
            inactive = { fg = "#f6f6f6", bg = "#191d2e" },
            inactive_hover = { fg = "#f6f6f6", bg = "#1a73e8" },
          },
        },
        section_separators = {
          left = wezterm.nerdfonts.pl_left_hard_divider,
          right = wezterm.nerdfonts.pl_right_hard_divider,
        },
        component_separators = {
          left = wezterm.nerdfonts.pl_left_soft_divider,
          right = wezterm.nerdfonts.pl_right_soft_divider,
        },
        tab_separators = {
          -- https://wezterm.org/config/lua/wezterm/nerdfonts.html?h=wezterm.nerdfonts
          left = wezterm.nerdfonts.ple_upper_left_triangle,
          right = wezterm.nerdfonts.ple_lower_right_triangle,
        },
      },
      -- default: https://github.com/michaelbrusegard/tabline.wez#default-configuration
      sections = {
        tabline_a = {},
        tabline_b = {},
        tabline_c = {},
        tab_active = {
          "index",
          { "process", padding = { left = 0, right = 1 } },
        },
        tab_inactive = {
          "index",
          { "process", padding = { left = 0, right = 1 } },
        },
        tabline_x = { "mode", "workspace", "domain" },
        tabline_y = {},
        tabline_z = {},
      },
      extensions = {
        "resurrect",
      },
    })
  end,
}
