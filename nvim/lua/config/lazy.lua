-----------------------------------------------------------------------------
-- 插件管理器
-- https://github.com/folke/lazy.nvim
-----------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = {
        -- docs: https://www.lazyvim.org
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        { import = "lazyvim.plugins.extras.editor.mini-files" },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.rust" },
        { import = "lazyvim.plugins.extras.lang.docker" },
        { import = "lazyvim.plugins.extras.lsp.none-ls" },
        -- { import = "lazyvim.plugins.extras.coding.tabnine" },
        { import = "plugins" },
    },
    defaults = {
        lazy = true,
        version = true,
    },
    checker = {
        enabled = true,
    },
    change_detection = {
        notify = false,
    },
    performance = {
        -- disabled some built-in rtp plugins
        -- https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration
        rtp = {
            disabled_plugins = {
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
            },
        },
    },
})
