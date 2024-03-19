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

local function augroup(name)
    return autogrp("user_augroup_" .. name, {
        clear = true,
    })
end

local function lazy_augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
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

-- Override LazyVIM default: Check if we need to reload the file when it changed
-- https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/config/autocmds.lua#L8

-- Override LazyVIM default: wrap and check for spell in text filetypes
-- https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/config/autocmds.lua#L87
autocmd("FileType", {
    group = lazy_augroup("wrap_spell"),
    pattern = { "gitcommit" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})
