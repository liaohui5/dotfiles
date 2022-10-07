-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ 加速启动时间 & 识别文件类型                                                  │
-- │ https://github.com/nathom/filetype.nvim                                      │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local filetype = loadModule("filetype", "plugin-configs");

filetype.setup({
  overrides = {
    complex = {
      ["vifm/vifmrc"] = "vim", -- 文件路径包含 vifm/vifmrc 的文件, 设置为 vim 文件类型
      ["yabai/yabairc"] = "sh",
      ["skhd/skhdrc"] = "sh",
      ["spacebar/spacebarrc"] = "sh",
    },
    literal = {
      [".env"] = "sh", -- 文件名是 .env 的文件, 设置为 sh 文件类型
    },
    extensions = {
      env = "sh", -- 文件后缀名是 .env 的文件, 设置为 sh 文件类型
    }
  }
})
