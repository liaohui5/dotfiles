-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  侧边栏目录树                                                                │
-- │  docs: https://github.com/nvim-treesitter/nvim-treesitter                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local treesitterConfigs = loadModule("nvim-treesitter.configs", "plugin-configs")
local keys = require("keybindings").treesitterKeys()

treesitterConfigs.setup({
  sync_install     = true,
  auto_install     = true,
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
  indent           = { enable = false }, -- 不使用treesitter缩进功能
  keymaps          = keys.keymaps,
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │                                   语法高亮                                   │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  highlight        = {
    enable                            = true,
    additional_vim_regex_highlighting = false
  },

  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │  识别语法注释:                                                               │
  -- │  https://github.com/JoosepAlviste/nvim-ts-context-commentstring              │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │        不同括号不同颜色显示: https://github.com/p00f/nvim-ts-rainbow         │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  rainbow          = {
    enable         = true,
    disable        = { "jsx" }, -- 对某些语言禁用该功能
    extended_mode  = true,
    max_file_lines = nil,
    -- colors         = {},
    -- termcolors     = {}
  },
  textsubjects     = {
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │       选中增强: https://github.com/RRethy/nvim-treesitter-textsubjects       │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    enable         = true,
    prev_selection = keys.textsubjects_prev_selection,
    keymaps        = keys.textsubjects_keymaps,
  },
  autotag          = {
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │          xml标签自动闭合: https://github.com/windwp/nvim-ts-autotag          │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    enable = true
  },
  textobjects      = {
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                               众多功能集合体:                                │
    -- │        https://github.com/nvim-treesitter/nvim-treesitter-textobjects        │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    swap = {
      -- 调换函数参数的位置
      enable        = true,
      swap_next     = keys.textobjects_swap_next,
      swap_previous = keys.textobjects_swap_prev,
    },
    move = {
      -- 快速移动
      enable              = true,
      set_jumps           = true,
      goto_next_start     = keys.textobjects_move_goto_next_start,
      goto_next_end       = keys.textobjects_move_goto_next_end,
      goto_previous_start = keys.textobjects_goto_previous_start,
      goto_previous_end   = keys.textobjects_goto_previous_end,
    },
    select = {
      -- 快速选中: https://github.com/nvim-treesitter/nvim-treesitter-textobjects#built-in-textobjects
      enable                         = true,
      lookahead                      = true,
      include_surrounding_whitespace = false, -- BUG:not working
      keymaps                        = keys.textobjects_select_keymaps,
    },
  }
});

