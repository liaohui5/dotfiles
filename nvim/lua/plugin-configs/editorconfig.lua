----------------------------------------------------
-- 识别支持 editorconfig 文件
-- docs: https://github.com/gpanders/editorconfig.nvim
----------------------------------------------------

local ok,editorconfig  = pcall(require, "editorconfig")
if not ok then
  vim.notify("[plugin]: editorconfig not found")
end

editorconfig.properties.trim_trailing_whitespace = function(bufnr, val)
  vim.b[bufnr].trim_trailing_whitespace = false;
end
