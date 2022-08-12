----------------------------------------------------
-- 显示文件大纲预览
-- docs: https://github.com/windwp/nvim-autopairs
----------------------------------------------------
return {
  onstart = function(npairs)
    npairs.setup({ map_cr = true });
  end
}
