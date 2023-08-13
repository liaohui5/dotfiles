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
    lazypath
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    {
      -- use LazyVim
      "LazyVim/LazyVim",
      import = "lazyvim.plugins"
    },

    -- import lazyvim lsp preconfig: https://www.lazyvim.org/extras/lang/clangd
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.rust" },

    -- import LazyVim debug preconfig: https://www.lazyvim.org/extras/dap/core#nvim-dap
    -- { import = "lazyvim.plugins.extras.dap.core" },

    -- import LazyVim unit-test preconfig: https://www.lazyvim.org/extras/test/core
    -- { import = "lazyvim.plugins.extras.test.core" },

    -- install or override plugins config: https://www.lazyvim.org/configuration/plugins
    { import = "plugins" },
  },
  defaults = { -- when false use dev version
    lazy = true,
    version = true,
  },
  checker = { -- check plugin updates
    enabled = false
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
