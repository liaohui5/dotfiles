----------------------------------------------------
-- 识别支持 editorconfig 文件
-- docs: https://github.com/gpanders/editorconfig.nvim
----------------------------------------------------
return {
  onstart = function(editorconfig)
    editorconfig.properties.trim_trailing_whitespace = function(bufnr, val)
      vim.b[bufnr].trim_trailing_whitespace = false;
    end
  end
}
