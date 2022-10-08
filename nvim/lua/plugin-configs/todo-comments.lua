-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  高亮TODO注释                                                                │
-- │  docs: https://github.com/folke/todo-comments.nvim                           │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local todoComments = loadModule("todo-comments", "plugin-configs");

-- TODO: 修改颜色
todoComments.setup({
  signs          = true,
  sign_priority  = 8,
  merge_keywords = true,
  keywords       = {
    FIX = {
      icon  = " ",
      color = "error",
      alt   = {
        "FIXME",
        "BUG",
        "FIXIT",
        "ISSUE",
      },
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "ﭧ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  gui_style      = { fg = "NONE", bg = "BOLD" },
  highlight      = {
    before        = "",
    keyword       = "wide",
    after         = "fg",
    pattern       = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len  = 400,
    exclude       = {},
  },
  colors         = {
    error   = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
    info    = { "DiagnosticInfo", "#2563EB" },
    hint    = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
    test    = { "Identifier", "#FF00FF" }
  },
  search         = {
    command = "rg",
    pattern = [[\b(KEYWORDS):]],
    args    = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
  },

});

require("keybindings").todoCommentKeys(todoComments);
