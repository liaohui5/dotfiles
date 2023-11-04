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
-- LazyVim default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local helpers = require("utils.helpers")
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    vim.keymap.set(mode, lhs, rhs, opts)
end

local function unmap(modes, lhs, opts)
    opts = opts or {}
    vim.keymap.del(modes, lhs, opts)
end

-- Move to window using the <ctrl> hjkl keys
unmap("n", "<C-h>")
unmap("n", "<C-j>")
unmap("n", "<C-k>")
unmap("n", "<C-l>")

-- Move Lines
unmap({ "n", "i", "v" }, "<A-j>")
unmap({ "n", "i", "v" }, "<A-k>")

-- Buffers
unmap("n", "<leader>`")

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
unmap("n", "<leader>ur")

-- Save file
map({ "v", "n" }, "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Show help doc with keyword under the cursor
unmap("n", "<leader>K")

-- Show lazy.nvim dashboard
unmap("n", "<leader>l")

-- New file
unmap("n", "<leader>fn")
unmap("n", "<leader>xl")
unmap("n", "<leader>xq")

-- Formatting
map({ "n", "v" }, "<leader>ff", function()
    Util.format({ force = true })
end, {
    desc = "Format Dcoument",
    noremap = true,
    silent = true,
})

-- toggle options
unmap("n", "<leader>uf")
unmap("n", "<leader>uF")
unmap("n", "<leader>us")
unmap("n", "<leader>uw")
unmap("n", "<leader>uL")
unmap("n", "<leader>ul")
unmap("n", "<leader>ud")
unmap("n", "<leader>uc")
if vim.lsp.inlay_hint then
    unmap("n", "<leader>uh")
end

map("n", "<leader>tl", function()
    Util.toggle("relativenumber")
end, { desc = "Toggle Relative Line Numbers" })
map("n", "<leader>tL", function()
    Util.toggle.number()
end, { desc = "Toggle Line Numbers" })

-- lazygit
map("n", "<c-g>", function()
    Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, {
    desc = "Lazygit",
    silent = true,
})

-- quit
map("n", "<C-q>", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
unmap("n", "<leader>ui")

-- LazyVim Changelog
map("n", "<leader>L", function()
    Util.news.changelog()
end, { desc = "LazyVim Changelog" })

-- floating terminal
unmap("n", "<leader>ft")
unmap("n", "<leader>fT")
unmap("n", "<c-/>")
unmap("n", "<c-_>")

-- Terminal Mappings
unmap("t", "<esc><esc>")
unmap("t", "<C-h>")
unmap("t", "<C-j>")
unmap("t", "<C-k>")
unmap("t", "<C-l>")

---------------------------
---------- customs --------
---------------------------

-- better $
map({ "n", "x" }, "$", "$h", { silent = true, remap = true })

-- better delete
map({ "n", "x" }, "x", [["_x]], { silent = true, desc = "delete" })

-- better scroll
map({ "n", "x" }, "<c-d>", "10jzz", { silent = true })
map({ "n", "x" }, "<c-u>", "10kzz", { silent = true })

-- better paste
map("n", "p", [["+p]], { noremap = true, silent = true })
map("v", "p", [["_c<c-r><c-o>+<Esc>]], { silent = true, noremap = true })

-- search selection word
map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- better command line keymap
map("c", "<c-j>", "<c-n>", { noremap = true })
map("c", "<c-k>", "<c-p>", { noremap = true })
map("c", "<c-h>", "<Left>", { noremap = true })
map("c", "<c-l>", "<Right>", { noremap = true })

-- toggle completation
map("n", "<leader>tt", helpers.toggle_completation_status, {
    desc = "toggle auto completion enabled status",
})

-- toggle show invisible characters
map("n", "<leader>tc", helpers.toggle_invisible_characters, {
    desc = "toggle show invisible characters",
})

-- open file in visual studio code
map("n", "<leader>ov", helpers.buf_open_in_vscode, {
    desc = "open buffer in vscode",
})
map("n", "<leader>oV", helpers.cwd_open_in_vscode, {
    desc = "open cwd in vscode",
})

