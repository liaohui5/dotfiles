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
local override_highlights = require("utils.highlight")

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
        vim.b.autoformat = false
    end
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
    end
})

-- override highlights and filetypes
autocmd("BufEnter", {
    group = augroup("overrides"),
    callback = function()
        auto_set_filetypes()
        override_highlights()
    end,
})

-- set `formatoptions` after options seted
-- autocmd("OptionSet", {
--     group = augroup("set_formatoptions"),
--     callback = function()
-- vim.opt.formatoptions:append("r")
-- vim.opt.formatoptions:remove("o")
-- vim.opt.shortmess:append({ W = true, I = true, c = true })
--     end,
-- })

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
