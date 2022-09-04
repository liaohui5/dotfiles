----------------------------------------------------
-- 注释快捷键插件
-- docs: https://github.com/b3nj5m1n/kommentary
-- others: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
----------------------------------------------------
local ok, config = pcall(require, "kommentary.config")
if not ok then
  vim.notify("[plugin]: kommentary.config not found")
end

vim.g.kommentary_create_default_mappings = false

-- 配置语言对应的单行注释和多行注释
local languages = {
  lua = {
    single_line_comment_string  = "--",
    prefer_single_line_comments = true,
  },
  javascript = {
    single_line_comment_string = "//",
    multi_line_comment_strings = { "/*", "*/" },
  },
  javascriptreact = {
    single_line_comment_string = "//",
    multi_line_comment_strings = { "/*", "*/" },
  },
  typescript = {
    single_line_comment_string = "//",
    multi_line_comment_strings = { "/*", "*/" },
  },
  typescriptreact = {
    single_line_comment_string = "//",
    multi_line_comment_strings = { "/*", "*/" },
  },
  css = {
    multi_line_comment_strings = { "/*", "*/" },
    prefer_multi_line_comments = true,
  },
  less = {
    multi_line_comment_strings = { "/*", "*/" },
    prefer_multi_line_comments = true,
  },
  scss = {
    multi_line_comment_strings = { "/*", "*/" },
    prefer_multi_line_comments = true,
  }
};

for language, item in pairs(languages) do
  config.configure_language(language, item)
end

require("keybindings").kommentaryKeys()
