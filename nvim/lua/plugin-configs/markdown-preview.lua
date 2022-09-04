----------------------------------------------------------------
-- 预览 markdown 文件
-- docs: https://github.com/iamcco/markdown-preview.nvim
----------------------------------------------------------------
return {
  onstart = function ()
    vim.g.mkdp_theme = 'light';
    require("keybindings").markdownPreviewKeys();
  end
}
