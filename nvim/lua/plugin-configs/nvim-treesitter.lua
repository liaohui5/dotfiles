----------------------------------------------------
-- 侧边栏目录树
-- docs: https://github.com/nvim-treesitter/nvim-treesitter
----------------------------------------------------
local config = {};

config.onstart = function(configs)
  configs.setup({
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- supported languages
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
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    },

    -- highlight
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },

    -- indent
    indent = {
      enable = true
    }
  });

end

return config;
