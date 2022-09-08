-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  显示文件大纲预览                                                            │
-- │  docs: https://github.com/windwp/nvim-autopairs                              │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local templateString = loadModule("template-string", "plugin-configs")

templateString.setup({
  jsx_brackets           = true,
  remove_template_string = true, -- 模板字符串中没有引用变量就变回'或者"
  filetypes = {
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
  },
  restore_quotes = {
    -- 当需要变回'或者"的时候, 使用哪个符号
    normal = [["]],
    jsx    = [["]],
  },
})
