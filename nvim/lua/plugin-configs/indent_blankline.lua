----------------------------------------------------
-- 垂直显示缩进距离
-- docs: https://github.com/lukas-reineke/indent-blankline.nvim
----------------------------------------------------
local indent_blankline = loadModule("indent_blankline", "plugin-configs")

indent_blankline.setup({
  filetype_exclude = { "dashboard" },
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,
});
