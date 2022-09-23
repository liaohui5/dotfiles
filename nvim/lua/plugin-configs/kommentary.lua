----------------------------------------------------
-- 注释快捷键插件
-- docs: https://github.com/b3nj5m1n/kommentary
-- others: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
----------------------------------------------------
local kommentaryConfig = loadModule("kommentary.config", "plugin-configs");
local tsCtxCommentStr  = loadModule("ts_context_commentstring.internal", "plugin-configs");

vim.g.kommentary_create_default_mappings = false

-- 配置语言对应的单行注释和多行注释
local languages = {
  lua = {
    prefer_single_line_comments = true,
  },
  javascript = {
    prefer_single_line_comments = true,
  },
  typescript = {
    prefer_single_line_comments = true,
  },
  javascriptreact = { -- jsx
    multi_line_comment_strings = { "{/*", "*/}" },
    prefer_multi_line_comments = true,
  },
  typescriptreact = { -- tsx
    multi_line_comment_strings = { "{/*", "*/}" },
    prefer_multi_line_comments = true,
  },
  css = {
    prefer_multi_line_comments = true,
  },
  less = {
    prefer_multi_line_comments = true,
  },
  scss = {
    prefer_multi_line_comments = true,
  },
  vue = {},
};

for language, item in pairs(languages) do
  if not item.single_line_comment_string then
    item.single_line_comment_string = 'auto';
  end
  if not item.multi_line_comment_strings then
    item.multi_line_comment_strings = 'auto';
  end
  item.hook_function = function()
    tsCtxCommentStr.update_commentstring();
  end
  kommentaryConfig.configure_language(language, item)
end

require("keybindings").kommentaryKeys()
