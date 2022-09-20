-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ 代码格式刷配置                                                               │
-- │ docs: https://github.com/mhartington/formatter.nvim                          │
-- │ prettier:  https://prettier.io/docs/en/index.html                            │
-- │ 同类插件: https://github.com/sbdchd/neoformat                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local formatter = loadModule("formatter", "plugin-configs")

-- prettier 支持的文件就用 prettier 格式化
local filetype          = {};
local prettierSupported = getPrettierSupportedLanguages();
local prettierFormatter = function()
  return {
    exe = "prettier",
    stdin = true,
    args = {
      "--stdin-filepath",
      vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
    },
  }
end

for key, item in ipairs(prettierSupported) do
  if item then
    filetype[key] = { prettierFormatter }
  end
end

formatter.setup({
  filetype = filetype,
})
