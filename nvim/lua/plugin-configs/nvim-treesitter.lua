----------------------------------------------------
-- 侧边栏目录树
-- docs: https://github.com/nvim-treesitter/nvim-treesitter
----------------------------------------------------
local config = {};

config.onstart = function(configs)
  configs.setup({
    sync_install = true,
    auto_install = true,
    ensure_installed = {
      "css",
      "dot",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "scss",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml",
    },

    keymaps = {
      init_selection    = '<CR>',
      node_incremental  = '<CR>',
      node_decremental  = '<BS>',
      scope_incremental = '<TAB>',
    },
    highlight = {
      enable                            = true,
      additional_vim_regex_highlighting = false
    },
    indent = {
      -- 允许使用 treesitter 来缩进
      enable = true
    },
    context_commentstring = {
      -- 集成 Comment.nvim 插件
      enable         = true,
      enable_autocmd = false,
    },
  });

end

return config;
