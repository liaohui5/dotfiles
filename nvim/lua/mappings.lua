--  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .-----------------. .----------------.  .----------------.
-- | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
-- | | ____    ____ | || |      __      | || |   ______     | || |   ______     | || |     _____    | || | ____  _____  | || |    ______    | || |    _______   | |
-- | ||_   \  /   _|| || |     /  \     | || |  |_   __ \   | || |  |_   __ \   | || |    |_   _|   | || ||_   \|_   _| | || |  .' ___  |   | || |   /  ___  |  | |
-- | |  |   \/   |  | || |    / /\ \    | || |    | |__) |  | || |    | |__) |  | || |      | |     | || |  |   \ | |   | || | / .'   \_|   | || |  |  (__ \_|  | |
-- | |  | |\  /| |  | || |   / ____ \   | || |    |  ___/   | || |    |  ___/   | || |      | |     | || |  | |\ \| |   | || | | |    ____  | || |   '.___`-.   | |
-- | | _| |_\/_| |_ | || | _/ /    \ \_ | || |   _| |_      | || |   _| |_      | || |     _| |_    | || | _| |_\   |_  | || | \ `.___]  _| | || |  |`\____) |  | |
-- | ||_____||_____|| || ||____|  |____|| || |  |_____|     | || |  |_____|     | || |    |_____|   | || ||_____|\____| | || |  `._____.'   | || |  |_______.'  | |
-- | |              | || |              | || |              | || |              | || |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
-- 在这里定义快捷键映射:
-- mapclear - 取消所有自定义快捷键映射
-- nmap     - 查看 normal 模式快捷键
-- imap     - 查看 inrert 模式快捷键
-- vmap     - 查看 virual 模式快捷键
-- xmap     - 查看 virual block 模式快捷键
-- cmap     - 查看 command-line 模式快捷键
-- rmap     - 查看 select 模式快捷键
-- omap     - 查看 operator 模式快捷键
--- @diagnostic disable: lowercase-global
local keymap = vim.api.nvim_set_keymap
local option = { noremap = true, silent = true }

-- 将空格键设置为 <leader> 键
keymap("", " ", "<Nop>", option)
vim.g.mapleader = " "
vim.g.localleader = " "

-- nmap/nnoremap
function nmap(keys, commands)
	keymap("n", keys, commands, { silent = true })
end

function nnoremap(keys, commands)
	keymap("n", keys, commands, option)
end

-- vmap/vnoremap
function vmap(keys, commands)
	keymap("v", keys, commands, { silent = true })
end

function vnoremap(keys, commands)
	keymap("v", keys, commands, option)
end

-- imap/inoremap
function imap(keys, commands)
	keymap("i", keys, commands, { silent = true })
end

function inoremap(keys, commands)
	keymap("i", keys, commands, option)
end

-- xmap/xnoremap
function xmap(keys, commands)
	keymap("x", keys, commands, { silent = true })
end

function xnoremap(keys, commands)
	keymap("x", keys, commands, option)
end

-- cmap/cnoremap
function cmap(keys, commands)
	keymap("c", keys, commands, { silent = true })
end

function cnoremap(keys, commands)
	keymap("c", keys, commands, option)
end

-- tmap/tnoremap
function tnoremap(keys, commands)
  keymap("t", keys, commands, option)
end

-- 退出编辑器
nnoremap("<C-q>", ":quitall!<CR>")

-- 取消高亮
nnoremap("-", ":nohl<CR>")

-- p: 仅粘贴, 而不是粘贴后复制
vnoremap("p", '"_c<C-r><C-o>+<Esc>')

-- 修改默认的 $
nnoremap("$", "$h")
vnoremap("$", "$h")

-- x 删除而不是剪切
nnoremap("x", '"_x')
xnoremap("x", '"_x')

-- 选中/删除当前单词
nnoremap("vw", "viw")
nnoremap("cw", "ciw")
nnoremap("dw", "diw")

-- buffer 切换
nnoremap("<S-h>", ":bprevious<CR>")
nnoremap("<S-l>", ":bnext<CR>")

-- 左右缩进
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- 在分屏时调整当前窗口大小
nnoremap("<C-Right>", ":vertical resize-1<CR>")
nnoremap("<C-Left>", ":vertical resize+1<CR>")
nnoremap("<C-Down>", ":resize-1<CR>")
nnoremap("<C-Up>", ":resize+1 <CR>")

-- 滚动并且保持当前行居中屏幕
nnoremap("<C-u>", "10kzz")
nnoremap("<C-d>", "10jzz")
nnoremap("<C-f>", "<C-f>zz")
nnoremap("<C-b>", "<C-b>zz")

-- 命令行左右移动/上下选中
cmap("<C-j>", "<C-n>")
cmap("<C-k>", "<C-p>")

-- 上下移动选中行
xnoremap("<C-j>", "<cmd>move '>+1<CR>gv-gv")
xnoremap("<C-k>", "<cmd>move '<-2<CR>gv-gv")
xnoremap("<leader>xJ", "<cmd>move '>+1<CR>gv-gv")
xnoremap("<leader>xK", "<cmd>move '<-2<CR>gv-gv")

-- 快速输出: javascript console.log
nnoremap("<leader>il", [["ayiwoconsole.log('<C-R>a:', <C-R>a);<Esc>]])
xnoremap("<leader>il", [["ayoconsole.log('<C-R>a:', <C-R>a);<Esc>]])
