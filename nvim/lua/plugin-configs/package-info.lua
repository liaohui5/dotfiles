-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                       在 package.json 中执行 npm 操作                        │
-- │              docs: https://github.com/vuki656/package-info.nvim              │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local packageInfo = loadModule("package-info", "plugin-configs");

packageInfo.setup({
  autostart              = true,
  hide_up_to_date        = true,
  hide_unstable_versions = false,
  package_manager        = "npm", -- npm | pnpm | yarn
  colors                 = {
    up_to_date = "#3C4048",
    outdated   = "#d19a66",
  },
  icons                  = {
    enable = true,
    style  = {
      up_to_date = "|  ",
      outdated   = "|  ",
    },
  },
})


require("keybindings").packageInfoKeys();
