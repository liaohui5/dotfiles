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
        {
            -- use LazyVim
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
        },

        -- docs: https://www.lazyvim.org
        { import = "lazyvim.plugins.extras.editor.mini-files" },
        { import = "lazyvim.plugins.extras.lang.json" },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        { import = "lazyvim.plugins.extras.lang.rust" },
        { import = "lazyvim.plugins.extras.lang.docker" },
        { import = "plugins" },
    },
    defaults = { -- when false use dev version
        lazy = true,
        version = true,
    },
    checker = {
        enabled = true,
    },
    change_detection = {
        -- enabled = false,
        notify = false,
    },
    performance = { -- disabled some built-in rtp plugins
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
