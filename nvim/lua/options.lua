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
local opt          = vim.opt;
-- opt.shortmess      = "I"; -- 禁用 neovim 启动页介绍
opt.compatible     = false; -- 缺省vi兼容模式,不能用退格.设置为不兼容模式
opt.title          = true; -- 显示 title
opt.cursorline     = true; -- 高亮当前行
opt.list           = false; -- 是否显示空白符号
opt.clipboard      = "unnamedplus"; -- 使用系统粘贴板
opt.updatetime     = 100; -- 更新间隔时间(ms), 比如按下 <Leader> 键后没有再
opt.timeoutlen     = 0; -- 按其他键多久后自动取消 <Leader>
opt.signcolumn     = "yes"; -- 显示图标栏
opt.undofile       = true; -- 开启撤销永久化
opt.laststatus     = 3; -- 命令行状态 && 命令行高度
opt.cmdheight      = 1; -- 底部命令行的高度为1
opt.ruler          = false; -- 底部的行号等显示
opt.number         = true; -- 显示行号
opt.relativenumber = false; -- 相对当前行的行号
opt.numberwidth    = 4; -- 行号显示的宽度
opt.expandtab      = true; -- 将 tab 转空格
opt.tabstop        = 2; -- 一个tab设置为2空格的宽度
opt.softtabstop    = 2; -- 一个tab设置为2空格的宽度
opt.shiftwidth     = 2; -- 一个tab设置为2空格的宽度
opt.softtabstop    = 2; -- 一个tab设置为2空格的宽度
opt.wrap           = false; -- 不自动换行显示
opt.autoindent     = true; -- 自动缩进
opt.smarttab       = true; -- 会测试智能缩进
opt.encoding       = "utf-8"; -- 设置文件编码
opt.fileencodings  = "utf-8"; -- 设置文件编码
opt.fileencoding   = "utf-8"; -- 设置文件编码
opt.termencoding   = "utf-8"; -- 设置文件编码
opt.autoread       = true; -- 自动读取
opt.autowriteall   = true; -- 自动保存
opt.splitbelow     = true; -- 允许上下拆分窗口
opt.splitright     = true; -- 允许左右拆分窗口
opt.termguicolors  = true; -- terminal 颜色
opt.undofile       = true; -- 允许撤回文件
opt.hlsearch       = true; -- 搜索时高亮匹配到的字符
opt.wrapscan       = true; -- 扫描到文件两端时重新搜索
opt.smartcase      = true; -- 搜索时候区分大小写
opt.swapfile       = false; -- 不创建 swap 文件
opt.writebackup    = false; -- 不创建备份文件
opt.showmatch      = true; -- 当输入一个左括号时自动匹配右括号
opt.autochdir      = false; -- 自动切换当前目录为当前文件所在的目录
opt.hidden         = true; -- hidden
opt.fillchars      = "eob: "; -- 影藏空白区域~符号
opt.foldlevel      = 99; -- 打开文件时,不要自动折叠
opt.foldlevelstart = 99; -- 打开文件时,不要自动折叠
opt.foldenable     = true; -- 开启折叠功能
opt.foldmethod     = "indent"; -- 根据缩进折叠 indent | expr | manual
-- opt.foldexpr        = "nvim_treesitter#foldexpr()"; -- 使用 treesitter 来折叠

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

-- 禁止的 provider, 注释表示开启
local disable_default_providers = {
  -- "python3",
  -- "node",
  "ruby",
  "perl"
}

for _, provider in ipairs(disable_default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0;
end
