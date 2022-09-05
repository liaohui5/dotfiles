----------------------------------------------------
-- 快速移动光标位置, 类似 easymontion
-- docs: https://github.com/phaazon/hop.nvim
----------------------------------------------------
local hop = loadModule("hop", "plugin-configs")

hop.setup({ keys = 'etovxqpdygfblzhckisuran12345' })
require("keybindings").hopKeys();
