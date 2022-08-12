----------------------------------------------------
-- 代码对齐
-- docs: https://github.com/Vonr/align.nvim
----------------------------------------------------
return {
  onstart = function(align)
    -- 绑定快捷键
    require("keybindings").alignKeys(align);
  end
};
