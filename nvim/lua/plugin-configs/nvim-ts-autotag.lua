----------------------------------------------------
-- xml 标签自动补全
-- docs: https://github.com/windwp/nvim-ts-autotag
----------------------------------------------------

local ok, autotag = pcall(require, "nvim-ts-autotag")
if not ok then
  vim.notify("[plugin]: nvim-ts-autotag not found")
end

autotag.setup({})
