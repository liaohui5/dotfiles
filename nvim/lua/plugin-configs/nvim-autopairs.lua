----------------------------------------------------
-- 显示文件大纲预览
-- docs: https://github.com/windwp/nvim-autopairs
----------------------------------------------------
local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  vim.notify("[plugin]: nvim-autopairs not found")
end

autopairs.setup({ map_cr = true });
