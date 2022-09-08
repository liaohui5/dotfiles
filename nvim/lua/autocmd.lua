--  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
--  | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
--  | |      __      | || | _____  _____ | || |  _________   | || |     ____     | || |     ______   | || | ____    ____ | || |  ________    | |
--  | |     /  \     | || ||_   _||_   _|| || | |  _   _  |  | || |   .'    `.   | || |   .' ___  |  | || ||_   \  /   _|| || | |_   ___ `.  | |
--  | |    / /\ \    | || |  | |    | |  | || | |_/ | | \_|  | || |  /  .--.  \  | || |  / .'   \_|  | || |  |   \/   |  | || |   | |   `. \ | |
--  | |   / ____ \   | || |  | '    ' |  | || |     | |      | || |  | |    | |  | || |  | |         | || |  | |\  /| |  | || |   | |    | | | |
--  | | _/ /    \ \_ | || |   \ `--' /   | || |    _| |_     | || |  \  `--'  /  | || |  \ `.___.'\  | || | _| |_\/_| |_ | || |  _| |___.' / | |
--  | ||____|  |____|| || |    `.__.'    | || |   |_____|    | || |   `.____.'   | || |   `._____.'  | || ||_____||_____|| || | |________.'  | |
--  | |              | || |              | || |              | || |              | || |              | || |              | || |              | |
--  | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
--   '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
-- 启动 neovim 自动执行的脚本在这里执行
local imSelect      = loadModule("utils.im-select", "autocmd");
local autocmd       = vim.api.nvim_create_autocmd
local initAutoGroup = vim.api.nvim_create_augroup("initAutoGroup", { clear = true })

-- 注册自动生成一个 .editorconfig 文件的命令
vim.cmd([[command! -nargs=0 EditorConfigGenerator execute ":silent !cp ~/.config/nvim/.editorconfig ."]])

-- 允许语法检测 和 文件类型检测
vim.cmd([[
  filetype on         " 开启文件类型检测
  filetype plugin on  " 让插件识别文件类型
  filetype indent on  " 让插件识别缩进
  syntax enable       " 允许语法检测
]])

-- 进入Terminal 自动进入插入模式
autocmd("TermOpen", {
  group   = initAutoGroup,
  command = "startinsert",
})

-- 复制时高亮一下复制的内容
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank();
  end,
  group    = initAutoGroup,
  pattern  = "*",
})

-- node_modules 禁止代码诊断
autocmd("BufRead", {
  pattern = "*/node_modules/*",
  command = "lua vim.diagnostic.disable(0)"
})
autocmd("BufNewFile", {
  pattern = "*/node_modules/*",
  command = "lua vim.diagnostic.disable(0)"
})


-- 回车/用o 换行不要自动注释新的行
-- autocmd("BufEnter", {
--  group   = initAutoGroup,
-- 	pattern = "*",
-- 	command = "set fo-=c fo-=r fo-=o",
-- })
-- 用o/O换行不要自动注释新的行, 但是 enter 会自动延续
autocmd("BufEnter", {
  group    = initAutoGroup,
  pattern  = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
        - "o" -- normal 使用 o/O 不自动注释
        + "r" -- insert 使用 enter 自动注释
  end,
})

-- 自动切换输入法，需要安装 im-select
-- https://github.com/daipeihust/im-select
autocmd("InsertLeave", {
  group    = initAutoGroup,
  callback = function()
    imSelect.macInsertLeave()
  end
});
autocmd("InsertEnter", {
  group    = initAutoGroup,
  callback = function()
    imSelect.macInsertEnter()
  end
});

-- 保存时自动格式化
-- autocmd("BufWritePre", {
--   group = initAutoGroup,
--   pattern = { "*.lua", "*.sh" },
--   callback = function ()
--     vim.lsp.buf.formatting_sync();
--   end
-- });

-- nvim-tree 自动关闭
-- autocmd("BufEnter", {
-- 	nested = true,
-- 	group = initAutoGroup,
-- 	callback = function()
-- 		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
-- 			vim.cmd("quit")
-- 		end
-- 	end,
-- })


-- 加载工具函数
vim.cmd [[runtime ./scripts/functions.vim]]
