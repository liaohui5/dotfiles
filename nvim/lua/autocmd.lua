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
local imSelect = require("utils.im-select");
local autocmd = vim.api.nvim_create_autocmd
local InitAutoGroup = vim.api.nvim_create_augroup("InitAutoGroup", { clear = true })

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
	group   = InitAutoGroup,
	command = "startinsert",
})

-- 复制时高亮一下复制的内容
autocmd("TextYankPost", {
	callback = vim.highlight.on_yank,
	group    = InitAutoGroup,
	pattern  = "*",
})

-- 回车/用o 换行不要自动注释新的行
-- autocmd("BufEnter", {
--  group   = InitAutoGroup,
-- 	pattern = "*",
-- 	command = "set fo-=c fo-=r fo-=o",
-- })
-- 用o/O换行不要自动注释新的行, 但是 enter 会自动延续
autocmd("BufEnter", {
	group    = InitAutoGroup,
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
  group    = InitAutoGroup,
  callback = imSelect.macInsertLeave,
});
autocmd("InsertEnter", {
  group    = InitAutoGroup,
  callback = imSelect.macInsertEnter,
});

-- 保存时自动格式化
-- autocmd("BufWritePre", {
--   group = InitAutoGroup,
--   pattern = { "*.lua", "*.sh" },
--   callback = vim.lsp.buf.formatting_sync,
-- });

-- nvim-tree 自动关闭
-- autocmd("BufEnter", {
-- 	nested = true,
-- 	group = InitAutoGroup,
-- 	callback = function()
-- 		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
-- 			vim.cmd("quit")
-- 		end
-- 	end,
-- })


-- 在浏览器中打开当前行的 url & 在浏览器中打开当前文件
vim.cmd[[
  function! OpenCurrentLineURL()
    let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    " echo s:uri
    if s:uri != ""
      silent exec "!open '".s:uri."'"
    else
      echo "No url found in current line"
    endif
  endfunction
  " nnoremap <leader>ou :call OpenCurrentLineURL()<cr>

  function! OpenFileWithGoogleChrome()
    let s:filepath = expand('%:p')
    let s:googlePath = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
    if s:filepath != ""
      silent exec "!open -a ".s:googlePath." -i=".s:filepath
    else
      echo "File not found"
    endif

    "open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome /fullpath/to/coc-settings.json
  endfunction
]]

