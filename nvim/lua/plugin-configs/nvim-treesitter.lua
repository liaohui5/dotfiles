----------------------------------------------------
-- 侧边栏目录树
-- docs: https://github.com/nvim-treesitter/nvim-treesitter
----------------------------------------------------
local config = {};

config.onstart = function(configs)
  local keys = require("keybindings").treesitterKeys()
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

    keymaps = keys.keymaps,
    rainbow = {
      -- 不同括号不同颜色显示: https://github.com/p00f/nvim-ts-rainbow
      enable         = true,
      disable        = { "jsx" }, -- 对某些语言禁用该功能
      extended_mode  = false,
      max_file_lines = nil,
      -- colors         = {},
      -- termcolors     = {}
    },

    textsubjects = {
      -- 选中增强: https://github.com/RRethy/nvim-treesitter-textsubjects
      enable         = true,
      prev_selection = keys.textsubjects_prev_selection,
      keymaps        = keys.textsubjects_keymaps,
    },
    autotag = {
      -- xml标签自动闭合: https://github.com/
      enable = true
    },
    highlight = {
      -- 语法高亮
      enable                            = true,
      additional_vim_regex_highlighting = false
    },
    indent = {
      -- 允许使用 treesitter 来缩进
      enable = true
    },
  });

end

return config;
