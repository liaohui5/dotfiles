----------------------------------------------------
-- 垂直显示缩进距离
-- docs: https://github.com/lukas-reineke/indent-blankline.nvim
-- 类似插件: https://github.com/glepnir/indent-guides.nvim
----------------------------------------------------
local indent_blankline = loadModule("indent_blankline", "plugin-configs")

indent_blankline.setup({
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,
  -- 禁止缩进
  indent_blankline_filetype_exclude = {
    "man",
    "help",
    "dashboard",
    "lspsagaoutline",
    "lspinfo",
    "packer",
    "checkhealth",
  }
});
