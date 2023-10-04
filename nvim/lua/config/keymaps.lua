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
    local keys = require("lazy.core.handler").handlers.keys
    -- do not create the keymap if a lazy keys handler exists
    ---@diagnostic disable-next-line: undefined-field
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then
            opts.remap = nil
        end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
    -- https://github.com/akinsho/bufferline.nvim
    map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
    map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
    map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
    map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
elseif Util.has("barbar.nvim") then
    -- https://github.com/romgrk/barbar.nvim
    map("n", "<S-h>", "<cmd>BufferPrevious<cr>", { desc = "Prev buffer" })
    map("n", "<S-l>", "<cmd>BufferNext<cr>", { desc = "Next buffer" })
    map("n", "[b", "<cmd>BufferPrevious<cr>", { desc = "Prev buffer" })
    map("n", "]b", "<cmd>BufferNext<cr>", { desc = "Next buffer" })
else
    map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
    map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
    map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
    map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map("n", "<esc>", "<cmd>nohl<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
-- map(
--     "n",
--     "<leader>ur",
--     "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--     { desc = "Redraw / clear hlsearch / diff update" }
-- )

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "v", "n" }, "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save file" })

-- show help doc with keyword under the cursor
-- map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- show lazy.nvim dashboard
-- map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- create new file
-- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- quick find code problems
if not Util.has("trouble.nvim") then
    map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
    map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- formatting
map({ "n", "v" }, "<leader>ff", function()
    require("lazyvim.plugins.lsp.format").format({ force = true })
end, {
    desc = "Format Dcoument",
    noremap = true,
    silent = true,
})

-- stylua: ignore start

-- toggle line number style
map("n", "<leader>tl", function() Util.toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
map("n", "<leader>tL", function() Util.toggle_number() end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
-- map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
-- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
-- map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
-- if vim.lsp.inlay_hint then
--   map("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
-- end

-- lazygit
-- map("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazygit (root dir)" })
-- map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = "Lazygit (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<C-q>", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
-- map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- LazyVim Changelog
map("n", "<leader>L", Util.changelog, {desc = "LazyVim Changelog"})

-- floating terminal
-- local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
-- map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

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

-- open file in Google Chrome
map("n", "<leader>oc", helpers.open_in_chrome, {
    desc = "open current file in chrome",
})
