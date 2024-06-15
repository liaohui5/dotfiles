-----------------------------------------------------------------------
-- 非插件的基础快捷键绑定
-- LazyVim default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-----------------------------------------------------------------------
local helpers = require("utils.helpers")

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function unmap(modes, lhs, opts)
  opts = opts or {}
  vim.keymap.del(modes, lhs, opts)
end

-- Move to window using the <ctrl> hjkl keys

-- Move Lines, yabai used these keys on my config
unmap({ "n", "i", "v" }, "<A-j>")
unmap({ "n", "i", "v" }, "<A-k>")

-- Buffers

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua

-- Add undo break-points

-- Save file
map({ "v", "n" }, "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Show help doc with keyword under the cursor

-- better indenting

-- commenting

-- Show lazy.nvim dashboard, bind in file: plugins/lazyvim.lua
unmap("n", "<leader>l")

-- New file

-- formatting
map({ "n", "v" }, "<leader>ff", "<cmd>LazyFormat<cr>", {
  desc = "Format",
  noremap = true,
})

-- diagnostic

-- toggle options

-- lazygit
map("n", "<C-g>", "<leader>gg", { remap = true })

-- quit
map("n", "<C-q>", "<leader>qq", { remap = true })

-- highlights under cursor

-- LazyVim Changelog
-- unmap("n", "<leader>L");

-- floating terminal
map({ "n", "t" }, "<c-x>", "<c-_>", { remap = true })

-- Terminal Mappings

-- windows

-- tabs

-----------------------------
---------- customs ----------
-----------------------------

-- better $
map({ "n", "x" }, "$", "$h", {
  silent = true,
  remap = true,
  noremap = true,
})

-- better delete
map({ "n", "x" }, "x", [["_x]], {
  silent = true,
  desc = "Delete",
  noremap = true,
})

-- better scroll
map({ "n", "x" }, "<c-d>", "10jzz", { silent = true })
map({ "n", "x" }, "<c-u>", "10kzz", { silent = true })

-- search selection word
map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- better command line keymap
map("c", "<c-j>", "<c-n>", { noremap = true })
map("c", "<c-k>", "<c-p>", { noremap = true })
map("c", "<c-h>", "<Left>", { noremap = true })
map("c", "<c-l>", "<Right>", { noremap = true })

-- toggle show invisible characters
map("n", "<leader>tc", helpers.toggle_invisible_characters, {
  desc = "Toggle show invisible characters",
})

-- open file in visual studio code
map("n", "<leader>ov", helpers.buf_open_in_vscode, {
  desc = "Open buffer in vscode",
})
map("n", "<leader>oV", helpers.cwd_open_in_vscode, {
  desc = "Open cwd in vscode",
})
