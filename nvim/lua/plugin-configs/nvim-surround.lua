----------------------------------------------------
-- 字符串两边的包裹字符操作
-- docs: https://github.com/kylechui/nvim-surround
-- options: https://github.com/kylechui/nvim-surround/blob/main/lua/nvim-surround/config.lua
----------------------------------------------------
local surround = loadModule("nvim-surround", "plugin-configs")

surround.setup({
  keymaps = require("keybindings").nvimSurroundKeys(),
});
