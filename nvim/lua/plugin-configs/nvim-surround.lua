----------------------------------------------------
-- 字符串两边的包裹字符操作
-- docs: https://github.com/kylechui/nvim-surround
-- options: https://github.com/kylechui/nvim-surround/blob/main/lua/nvim-surround/config.lua
----------------------------------------------------
local ok, surround = pcall(require, "nvim-surround")
if not ok then
  vim.notify("[plugin]: nvim-surround not found")
end

surround.setup({
  keymaps = require("keybindings").nvimSurroundKeys(),
});
