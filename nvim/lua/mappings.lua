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
local wk = require("which-key");
local keymap = vim.api.nvim_set_keymap
local option = { noremap = true, silent = true }

-- 将空格键设置为 <leader> 键
keymap("", ";", "<Nop>", option)
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

-- P: 仅粘贴, 而不是粘贴后复制
vnoremap("p", '"_dP')

-- 选中/删除当前单词
nnoremap("vw", "viw")
nnoremap("cw", "ciw")
nnoremap("dw", "diw")

-- ctrl u / ctrl + d 滚动10行, 并且保持当前行居中屏幕
nnoremap("<C-u>", "10kzz");
nnoremap("<C-d>", "10jzz");

-- 修改默认的 x, r, 直接删除而不剪切
nnoremap("x", '"_x')
vnoremap("x", '"_x')

-- 修改默认的 $
nnoremap("$", "$h")
vnoremap("$", "$h")

-- buffer 切换/关闭
nnoremap("<S-h>", ":bprevious<CR>")
nnoremap("<S-l>", ":bnext<CR>")

-- 左右缩进
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- 上下移动选中行
xnoremap("<M-j>", ":move '>+1<CR>gv-gv")
xnoremap("<M-k>", ":move '<-2<CR>gv-gv")

-- 跳转当前窗口大小
nnoremap("<C-Right>", ":vertical resize-1<CR>")
nnoremap("<C-Left>", ":vertical resize+1<CR>")
nnoremap("<C-Down>", ":resize-1<CR>")
nnoremap("<C-Up>", ":resize+1 <CR>")

-- 在窗口之间跳转光标(与zellij有冲突,所以禁用)
-- nnoremap("<M-h>", "<C-w>h")
-- nnoremap("<M-j>", "<C-w>j")
-- nnoremap("<M-k>", "<C-w>k")
-- nnoremap("<M-l>", "<C-w>l")

-- 命令行左右移动/上下选中
cmap("<C-j>", "<C-n>")
cmap("<C-k>", "<C-p>")

-- 创建文件/删除文件
-- nnoremap("<leader>nf", ":!touch ")
-- nnoremap("<leader>df", ":!rm -rf ")

-- 搜索替换
-- vnoremap("<C-f>", "gd<ESC>")

-- 找到当前行的括号并进入Insert模式
-- nnoremap("<M-i>", "0%i");

--------------------------------------
-- 内置功能绑定到快捷键菜单
--------------------------------------
wk.register({
  -- buffers
  ["<leader>b"]  = {
    name = "+Buffer",
  },
  ["<leader>b1"] = {
    "<cmd>bfirst",
    "first Buffer"
  },
  ["<leader>b0"] = {
    "<cmd>blast",
    "last Buffer"
  },
  ["<leader>bb"] = {
    "<cmd>buffers",
    "show all buffers"
  },
  ["<leader>bs"] = {
    "<cmd>buffers",
    "search buffers"
  },
  ["<leader>bd"] = {
    "<cmd>bprevious|bdelete #<CR>",
    "close current buffer"
  },
  ["<leader>bl"] = {
    "<cmd>vsplit<CR>",
    "move buffer to right"
  },
  ["<leader>bj"] = {
    "<cmd>vsplit<CR>",
    "move buffer to bottom"
  },
  ["<leader>bn"] = {
    "<cmd>bnext<CR>", -- H
    "next buffer"
  },
  ["<leader>bp"] = {
    "<cmd>bprevious<CR>", -- L
    "previous buffer"
  },
  ["<leader>bD"] = {
    "<cmd>%bd|e#|bd#<cr>|'\"",
    "close other buffers"
  },
  ["<leader>bY"] = {
    '<cmd>%y "',
    "copy buffer to clipboard"
  },
  ["<leader>bP"] = {
    function ()
      vim.cmd[[
        :%delete _
        :put+
      ]]
    end,
    "paste clipboard to buffer"
  },

  -- comments/code_action
  ["<leader>c"] = {
    name = "+Comment/CodeAction",
  },

  -- debugger
  ["<leader>d"] = {
    name = "+Debugger",
  },

  -- errors
  ["<leader>e"] = {
    name = "+Error",
  },

  -- find/file
  ["<leader>f"] = {
    name = "+File/Find",
    R = {
      "<cmd>RnvimrToggle<CR>",
      "open with ranger(C-n)[rnvimr]"
    },
    o = {
      "<cmd>!open .<CR>",
      "open file with system explorer"
    },
    L = {
      "<cmd>!open .<CR>",
      "open file with system explorer"
    },
    s = {
      "<cmd>write<CR>",
      "save current buffer"
    }
  },

  -- git
  ["<leader>g"] = {
    name = "+Git",
    i = {
      "<cmd>!git init .<CR>",
      "git init",
    },
  },

  -- helps
  ["<leader>h"] = {
    name = "+Help",
    d = {
      "<cmd>!open https://neovim.io/doc<CR>",
      "open neovim documentation"
    },
    D = {
      "<cmd>!open https://github.com/folke/which-key.nvim<CR>",
      "open which-key documentation"
    },
    i = {
      "<cmd>!open https://github.com/neovim/neovim/issues<CR>",
      "report neovim issue"
    },
  },

  -- insert
  ["<leader>i"] = {
    name = "+Insert",
    i = {
      "Insert Image URL"
    },
  },

  -- jump/join/split
  ["<leader>j"] = {
    name = "+Jump/join/split",
  },

  -- jump/join/split
  ["<leader>l"] = {
    name = "+List",
    l = {
      "<cmd>buffers<CR>",
      "show all buffers",
    },
  },

  -- open
  ["<leader>o"] = {
    name = "+Open",
    v = {
      "<cmd>!open https://vim.rtorr.com<CR>",
      "open vim-cheatsheet"
    },
    b = {
      "<cmd>call OpenFileWithGoogleChrome()<CR>",
      "open in browser",
    },
    u = {
      "<cmd>call OpenCurrentLineURL()<CR>",
      "open url in browser",
    },
  },

  -- project
  ["<leader>p"] = {
    name = "+Project",
  },

  -- quit
  ["<leader>q"] = {
    name = "+Quit",
    q = {
      "<cmd>quitall!<CR>",
      "quit all",
    },
  },

  -- Recent/Replace
  ["<leader>r"] = {
    name = "+Recent/Replace",
  },

  -- search/symbol
  ["<leader>s"] = {
    name = "+Search/Symbol",
    s = {
      "<cmd>write<CR>",
      "save current buffer",
    },
    h = {
      "Highlight world(gd)"
    },
  },

  -- window
  ["<leader>w"] = {
    name = "+Window",
    S = {
      "<cmd>split<CR>",
      "split window to bottom",
    },
    V = {
      "<cmd>vsplit<CR>",
      "split window to right",
    },
    -- TODO: close other window
    O = {
      "close other windows"
    },
  },

  -- text
  ["<leader>x"] = {
    name = "+Text",
    o = {
      "<cmd>call OpenCurrentLineURL()<CR>",
      "open url in browser",
    },
  },

  -- yank/copy
  ["<leader>y"] = {
    name = "+Yank/Copy",
    n = {
      "Copy current file name"
    },
    p = {
      "Copy current file absolute path "
    },
    P = {
      "Copy current file relative path"
    },
  },

  -- UI toggle
  ["<leader>T"] = {
    name = "+UI toggle"
  },

  -- Bookmarks
  ["<leader>B"] = {
    name = "+Bookmarks",
  },
});

wk.register({
  ["<leader>c"] = {
    name = "+Comment",
  },
  ["<leader>a"] = {
    name = "+Align",
  },
  ["<leader>j"] = {
    name = "+Jump/join/split",
  },
  ["<leader>r"] = {
    name = "+Replace",
  },
  ["<leader>s"] = {
    name = "+Search/Symbol",
    h = {
      "Highlight world(gd)"
    },
  },
  ["<leader>x"] = {
    name = "+Text",
    K = {
      "<cmd>move '>+1<CR>gv-gv",
      "move line up",
    },
    J = {
      "<cmd>move '<-2<CR>gv-gv",
      "move line down",
    },
  },


}, { mode = "v" })
