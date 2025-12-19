local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

return {
  setup = function()
    tabline.setup({
      options = {
        theme = "Monokai (base16)",
        icons_enabled = true,
        tabs_enabled = true,
        theme_overrides = {
          tab = {
            active = { fg = "#f6f6f6", bg = "#1a73e8" },
            inactive = { fg = "#f6f6f6", bg = "#3A3A3A" }, -- inactive tab bg color
            inactive_hover = { fg = "#f6f6f6", bg = "#1a73e8" },
          },
        },
        section_separators = {
          left = wezterm.nerdfonts.pl_left_hard_divider,
          right = wezterm.nerdfonts.pl_right_hard_divider,
        },
        component_separators = {
          left = "",
          right = "",
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
        tabline_x = {},
        tabline_y = { "ram", "cpu", "domain" },
        tabline_z = { "mode" },
      },
    })
  end,
}
