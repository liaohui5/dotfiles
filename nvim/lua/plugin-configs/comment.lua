----------------------------------------------------
-- 注释快捷键插件
-- docs: https://github.com/numToStr/Comment.nvim
----------------------------------------------------
return {
  onstart = function(comment)
    -- 启动时设置: 快捷键
    comment.setup({
      toggler = {
        line = "gcc",
        block = "gbc",
      },

      -- 选中模式下
      opleader = {
        line = "<C-\\>",
        block = "gb",
      },
    })
  end
}
