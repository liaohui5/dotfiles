--  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .-----------------. .----------------.
--  | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
--  | |     ____     | || |   ______     | || |  _________   | || |     _____    | || |     ____     | || | ____  _____  | || |    _______   | |
--  | |   .'    `.   | || |  |_   __ \   | || | |  _   _  |  | || |    |_   _|   | || |   .'    `.   | || ||_   \|_   _| | || |   /  ___  |  | |
--  | |  /  .--.  \  | || |    | |__) |  | || | |_/ | | \_|  | || |      | |     | || |  /  .--.  \  | || |  |   \ | |   | || |  |  (__ \_|  | |
--  | |  | |    | |  | || |    |  ___/   | || |     | |      | || |      | |     | || |  | |    | |  | || |  | |\ \| |   | || |   '.___`-.   | |
--  | |  \  `--'  /  | || |   _| |_      | || |    _| |_     | || |     _| |_    | || |  \  `--'  /  | || | _| |_\   |_  | || |  |`\____) |  | |
--  | |   `.____.'   | || |  |_____|     | || |   |_____|    | || |    |_____|   | || |   `.____.'   | || ||_____|\____| | || |  |_______.'  | |
--  | |              | || |              | || |              | || |              | || |              | || |              | || |              | |
--  | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
--   '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
-- 在这里定义启动 neovim 的选项
vim.opt.shortmess:append("c"); -- 禁用 neovim 启动页介绍
vim.opt.compatible      = false; -- 缺省vi兼容模式,不能用退格.设置为不兼容模式
vim.opt.title           = true; -- 显示 title
vim.opt.cursorline      = true; -- 高亮当前行
vim.opt.list            = false; -- 是否显示空白符号
vim.opt.clipboard       = "unnamedplus"; -- 使用系统粘贴板
vim.opt.updatetime      = 300; -- 更新间隔时间(ms), 比如按下 <Leader> 键后没有再
vim.opt.timeoutlen      = 0; -- 按其他键多久后自动取消 <Leader>
vim.opt.signcolumn      = "yes"; -- 显示图标栏
vim.opt.undofile        = true; -- 开启撤销永久化
vim.opt.laststatus      = 3; -- 命令行状态 && 命令行高度
vim.opt.cmdheight       = 1; -- 底部命令行的高度为1
vim.opt.ruler           = false; -- 底部的行号等显示
vim.opt.number          = true; -- 显示行号
vim.opt.relativenumber  = false; -- 相对当前行的行号
vim.opt.numberwidth     = 4; -- 行号显示的宽度
vim.opt.expandtab       = true; -- 将 tab 转空格
vim.opt.tabstop         = 2; -- 一个tab设置为2空格的宽度
vim.opt.softtabstop     = 2; -- 一个tab设置为2空格的宽度
vim.opt.shiftwidth      = 2; -- 一个tab设置为2空格的宽度
vim.opt.softtabstop     = 2; -- 一个tab设置为2空格的宽度
vim.opt.wrap            = false; -- 不自动换行显示
vim.opt.autoindent      = true; -- 自动缩进
vim.opt.smarttab        = true; -- 会测试智能缩进
vim.opt.encoding        = "utf-8"; -- 设置文件编码
vim.opt.fileencodings   = "utf-8"; -- 设置文件编码
vim.opt.fileencoding    = "utf-8"; -- 设置文件编码
vim.opt.termencoding    = "utf-8"; -- 设置文件编码
vim.opt.autoread        = true; -- 自动读取
vim.opt.autowriteall    = true; -- 自动保存
vim.opt.splitbelow      = true; -- 允许上下拆分窗口
vim.opt.splitright      = true; -- 允许左右拆分窗口
vim.opt.termguicolors   = true; -- terminal 颜色
vim.opt.undofile        = true; -- 允许撤回文件
vim.opt.hlsearch        = true; -- 搜索时高亮匹配到的字符
vim.opt.wrapscan        = true; -- 扫描到文件两端时重新搜索
vim.opt.smartcase       = true; -- 搜索时候区分大小写
vim.opt.swapfile        = false; -- 不创建 swap 文件
vim.opt.writebackup     = false; -- 不创建备份文件
vim.opt.showmatch       = true; -- 当输入一个左括号时自动匹配右括号
vim.opt.autochdir       = false; -- 自动切换当前目录为当前文件所在的目录
vim.opt.hidden          = true; -- hidden
vim.o.foldlevel         = 99; -- 打开文件时,不要自动折叠
vim.opt.foldlevelstart  = 99; -- 打开文件时,不要自动折叠
vim.opt.foldenable      = true; -- 开启折叠功能
vim.opt.foldmethod      = "indent"; -- 根据缩进折叠
-- vim.opt.foldmethod      = "expr";        -- 根据缩进折叠
-- vim.opt.foldexpr        = 'nvim_treesitter#foldexpr()'; -- 使用 treesitter 来折叠

-- 全局变量
vim.g.loaded_matchparen = false; -- 禁止自动匹配高亮括号

-- 内置插件
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
};

for _, plugin in pairs(default_plugins) do
  vim.g["loaded_" .. plugin] = 1;
end

-- 设置禁止的 provider
local default_providers = {
  -- "python3",
  "ruby",
  -- "node",
  "perl"
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0;
end

-----------------------------------------------------------------------
--                                                                   --
--                         global functions                          --
--                                                                   --
-----------------------------------------------------------------------

-- 安全的加载模块
---@diagnostic disable-next-line
function loadModule(require_path, scope)
  local status_ok, module = pcall(require, require_path);
  if status_ok then
    return module;
  else
    vim.notify(string.format("[%s]%s not found", scope, require_path));
    return {}
  end
end

-- 获取选中的
---@diagnostic disable-next-line
function getVisualSelection()
  vim.cmd('noautocmd normal! "vy"');
  ---@diagnostic disable-next-line
	local text = vim.fn.getreg('v');
	vim.fn.setreg('v', {});

	text = string.gsub(text, "\n", "");
	if #text > 0 then
		return text;
	else
		return '';
	end
end


-- 将table转换为字符串, 方便输出调试
---@diagnostic disable-next-line
-- function tab2str(o)
--   if type(o) == 'table' then
--     local s = '{ '
--     for k, v in pairs(o) do
--       if type(k) ~= 'number' then k = '"' .. k .. '"' end
--       s = s .. '[' .. k .. '] = ' .. tab2str(v) .. ','
--     end
--     return s .. '} '
--   else
--     return tostring(o)
--   end
-- end
