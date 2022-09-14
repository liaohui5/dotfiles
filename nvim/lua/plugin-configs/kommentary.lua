----------------------------------------------------
-- 注释快捷键插件
-- docs: https://github.com/b3nj5m1n/kommentary
-- others: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
----------------------------------------------------
local kommentaryConfig = loadModule("kommentary.config", "plugin-configs")

vim.g.kommentary_create_default_mappings = false

-- 配置语言对应的单行注释和多行注释
local languages = {
  lua = {
    single_line_comment_string  = "--",
    prefer_single_line_comments = true,
  },
  javascript = {
    single_line_comment_string = "//",
    prefer_single_line_comments = true,
  },
  javascriptreact = {
    multi_line_comment_strings = { "{/*", "*/}" },
    prefer_multi_line_comments = true,
  },
  typescript = {
    single_line_comment_string = "//",
    prefer_single_line_comments = true,
  },
  typescriptreact = {
    multi_line_comment_strings = { "{/*", "*/}" },
    prefer_multi_line_comments = true,
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
  kommentaryConfig.configure_language(language, item)
end

require("keybindings").kommentaryKeys()
