----------------------------------------------------
-- 代码格式刷配置
-- docs: https://github.com/mhartington/formatter.nvim
----------------------------------------------------
local ok, formatter = pcall(require, "formatter")
if not ok then
  vim.notify("[plugin]: formatter not found")
end

-- prettier 格式化
local prettierFormatter = {
  function()
    return {
      exe = "prettier",
      args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
      stdin = true,
    }
  end
}

formatter.setup({
  filetype = {
    -- lua = {
    -- 	-- 格式化 lua 的程序, 所以使用 lsp server
    -- 	-- 需要安装 stylua: brew install stylua
    -- 	function()
    -- 		return {
    -- 			exe   = "stylua",
    -- 			args  = { "-" },
    -- 			stdin = true,
    -- 		}
    -- 	end,
    -- },
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
