----------------------------------------------------
-- 垂直显示缩进距离
-- docs: https://github.com/lukas-reineke/indent-blankline.nvim
----------------------------------------------------
return {
  onstart = function(indent_blankline)
    indent_blankline.setup({
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = false,
    });
  end
}
