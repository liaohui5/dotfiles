----------------------------------------------------------------------------------
-- 文件图标插: https://github.com/kyazdani42/nvim-web-devicons
----------------------------------------------------------------------------------
local ok, devicons = pcall(require, "devicons")
if not ok then
  vim.notify("[plugin]: devicons not found")
end

devicons.setup({})
