----------------------------------------------------
-- 垂直显示缩进距离
-- docs: https://github.com/lukas-reineke/indent-blankline.nvim
----------------------------------------------------

local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
  vim.notify("[plugin]: indent_blankline not found")
end

indent_blankline.setup({
  filetype_exclude = { "dashboard" },
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,
});
