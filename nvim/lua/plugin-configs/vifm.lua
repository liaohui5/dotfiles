-----------------------------------------------------------
-- 终端文件管理器 vifm 继承
-- docs: https://github.com/vifm/vifm.vim
-----------------------------------------------------------
return {
  onstart = function ()
    require("keybindings").vifmKeys();
  end
}
