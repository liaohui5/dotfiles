-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ 代码格式刷配置                                                               │
-- │ docs: https://github.com/mhartington/formatter.nvim                          │
-- │ 同类插件: https://github.com/sbdchd/neoformat                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local formatter = loadModule("formatter", "plugin-configs")

-- prettier 格式化
local prettierFormatter = {
  function()
    return {
      exe = "prettier",
      stdin = true,
      args = {
        "--stdin-filepath",
        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
      },
    }
  end
}

formatter.setup({
  filetype = {
    javascript      = prettierFormatter,
    javascriptreact = prettierFormatter,
    typescript      = prettierFormatter,
    typescriptreact = prettierFormatter,
    css             = prettierFormatter,
    scss            = prettierFormatter,
    less            = prettierFormatter,
    vue             = prettierFormatter,
    html            = prettierFormatter,
    yaml            = prettierFormatter,
    json            = prettierFormatter,
    markdown        = prettierFormatter,
    graphql         = prettierFormatter
  },
})

-- 格式化当前文件的快捷键
require("keybindings").formatterKeys()

-- 保存的时候格式化
-- vim.api.nvim_exec([[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost *.js,*.ts,*.rs,*.lua FormatWrite
--   augroup END
-- ]], true)
