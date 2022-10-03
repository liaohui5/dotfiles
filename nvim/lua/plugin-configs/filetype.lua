-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ 加速启动时间 & 识别文件类型                                                  │
-- │ https://github.com/nathom/filetype.nvim                                      │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local filetype = loadModule("filetype", "plugin-configs");

filetype.setup({
  overrides = {
    complex = {
      ["vifm/vifmrc"] = "vim", -- 识别 vifm/vifmrc 为 vim 文件类型
    },
  }
})
