----------------------------------------------------
-- 快速移动光标位置, 类似 easymontion
-- docs: https://github.com/phaazon/hop.nvim
----------------------------------------------------
local ok, hop = pcall(require, "hop")
if not ok then
  vim.notify("[plugin]: hop not found")
end

hop.setup({ keys = 'etovxqpdygfblzhckisuran12345' })
require("keybindings").hopKeys();
