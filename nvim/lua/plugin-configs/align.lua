----------------------------------------------------
-- 代码对齐
-- docs: https://github.com/Vonr/align.nvim
----------------------------------------------------
local ok, align = pcall(require,"align")
if not ok then
  vim.notify("[plugin]: align not found")
end

require("keybindings").alignKeys(align);
