----------------------------------------------------
-- 代码对齐
-- docs: https://github.com/Vonr/align.nvim
----------------------------------------------------
return {
  onstart = function()
    -- 绑定快捷键
    require("keybindings").alignKeys();
  end
};
