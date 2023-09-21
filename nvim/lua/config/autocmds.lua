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
-- LazyVim default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup
local auto_set_filetypes = require("utils.filetype")

local function augroup(name)
    return autogrp("user_augroup_" .. name, {
        clear = true,
    })
end

-- disable auto format when save
autocmd("FileType", {
    group = augroup("disable_auto_format"),
    pattern = "*",
    callback = function()
        ---@diagnostic disable-next-line: inject-field
        vim.b.autoformat = false
    end,
})

-- auto save
autocmd({ "InsertLeave", "TextChanged" }, {
    group = augroup("auto_save"),
    pattern = "*",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_call(buf, function()
            vim.cmd("silent! write")
        end)
    end,
})

-- dot not auto add comment when add new line
autocmd("OptionSet", {
    group = augroup("override_opts"),
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- override highlights and filetypes
autocmd("BufEnter", {
    group = augroup("overrides"),
    callback = function()
        auto_set_filetypes()
    end,
})

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("checktime"),
    command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup("last_loc"),
    callback = function()
        local exclude = { "gitcommit" }
        local buf = vim.api.nvim_get_current_buf()
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
            return
        end
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})
