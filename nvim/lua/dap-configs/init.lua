--  .----------------.  .----------------.  .----------------.
-- | .--------------. || .--------------. || .--------------. |
-- | |  ________    | || |      __      | || |   ______     | |
-- | | |_   ___ `.  | || |     /  \     | || |  |_   __ \   | |
-- | |   | |   `. \ | || |    / /\ \    | || |    | |__) |  | |
-- | |   | |    | | | || |   / ____ \   | || |    |  ___/   | |
-- | |  _| |___.' / | || | _/ /    \ \_ | || |   _| |_      | |
-- | | |________.'  | || ||____|  |____|| || |  |_____|     | |
-- | |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'
--------------------------------------------------------------
-- 调试 debugger 配置, 注意配置文件加载顺序
--------------------------------------------------------------
local dap_configs = {
  "dap-virutal-text", -- 断点 virtual-text 配置
  "dap-ui",           -- 断点UI配置
  "dap",              -- 断点服务器配置
}

for _, item in pairs(dap_configs) do
  require("dap-configs." .. item).onstart();
end

-- 配置快捷键
require("keybindings").dapKeys();
