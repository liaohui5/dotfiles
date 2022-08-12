----------------------------------------------------
-- 文件管理 ranger 集成
-- docs: https://github.com/kevinhwang91/rnvimr
----------------------------------------------------
return {
  onstart = function ()
    vim.cmd[[runtime ./scripts/rnvimr.vim]]
  end
}

