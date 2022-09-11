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
-- 将空格键设置为 <leader> 键
vim.api.nvim_set_keymap("", " ", "<Nop>", { 
  noremap = true,
  silent = true
})
vim.g.mapleader = " "
vim.g.localleader = " "

-- 退出编辑器
nnoremap("<C-q>", "<cmd>quitall!<CR>")

-- 取消高亮
nnoremap("-", "<cmd>nohl<CR>")

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
nnoremap("<leader>b1", "<cmd>bfirst<CR>")
nnoremap("<leader>b0", "<cmd>blast<CR>")
nnoremap("<leader>bb", "<cmd>buffers<CR>")
nnoremap("<leader>bs", "<cmd>buffers<CR>")
nnoremap("<leader>bd", "<cmd>bprevious|bdelete #<CR>")
nnoremap("<leader>bl", "<cmd>vsplit<CR>")
nnoremap("<leader>bj", "<cmd>split<CR>")
nnoremap("<leader>bn", "<cmd>bnext<CR>")
nnoremap("<leader>bp", "<cmd>bprevious<CR>")
nnoremap("<leader>bD", "<cmd>%bd|e#|bd#<cr>|'\"<CR>")
nnoremap("<leader>bY", '<cmd>%y "<CR>')
nnoremap("<S-h>", "<cmd>bprevious<CR>")
nnoremap("<S-l>", "<cmd>bnext<CR>")

-- 左右缩进
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- 在分屏时调整当前窗口大小
nnoremap("<C-Right>", "<cmd>vertical resize-1<CR>")
nnoremap("<C-Left>", "<cmd>vertical resize+1<CR>")
nnoremap("<C-Down>", "<cmd>resize-1<CR>")
nnoremap("<C-Up>", "<cmd>resize+1 <CR>")

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

-- find/file
nnoremap("<leader>fo", [[<cmd>silent execute "open ."<CR>]])
nnoremap("<leader>fL", [[<cmd>silent execute "open ."<CR>]])
nnoremap("<leader>fs", [[<cmd>write<CR>]])

-- git
nnoremap("<leader>gi", [[<cmd>silent execute "!git init"<CR>]])

-- helps
nnoremap("<leader>hd", "<cmd>call SilentOpenURL('https://neovim.io/doc')<CR>")
nnoremap("<leader>hD", "<cmd>call SilentOpenURL('https://github.com/folke/which-key.nvim')<CR>")
nnoremap("<leader>hi", "<cmd>call SilentOpenURL('https://github.com/neovim/neovim/issues')<CR>")

-- vim links
nnoremap("<leader>ov0", "<cmd>call SilentOpenURL('https://vim-adventures.com')<CR>")
nnoremap("<leader>ov1", "<cmd>call SilentOpenURL('https://vim.rtorr.com')<CR>")
nnoremap("<leader>ov2", "<cmd>call SilentOpenURL('https://github.com/chloneda/vim-cheatsheet')<CR>")
nnoremap("<leader>ov3", "<cmd>call SilentOpenURL('https://www.w3cschool.cn/vim/4xnd1hsw.html')<CR>")
nnoremap("<leader>ov4", "<cmd>call SilentOpenURL('https://yianwillis.github.io/vimcdoc/doc/help.html')")

-- open
nnoremap("<leader>ob", "<cmd>call OpenFileWithGoogleChrome()<CR>")
nnoremap("<leader>ou", "<cmd>call OpenCurrentLineURL()<CR>")
nnoremap("<leader>og", "<cmd>call OpenInGithubDesktop()<CR>")

-- quitall
nnoremap("<leader>qq", "<cmd>quitall!<CR>")

-- save
nnoremap("<leader>ss", "<cmd>write<CR>")

-- window
nnoremap("<leader>wS", "<cmd>split<CR>")
nnoremap("<leader>wV", "<cmd>vsplit<CR>")
nnoremap("<leader>wO", "<cmd>only<CR>")

-- text
nnoremap("<leader>xo", "<cmd>call OpenCurrentLineURL()<CR>")

-- yank
nnoremap("<leader>yn", "<cmd>let @+ = expand('%:t')<CR>")
nnoremap("<leader>yp", "<cmd>let @+ = expand('%:p')<CR>")
nnoremap("<leader>yp", "<cmd>let @+ = expand('%')<CR>")

