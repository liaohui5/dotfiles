-- ╭────────────────────────────────────────────────────────────────────────────────────────╮
-- │  搜索文件/buffer/字符串                                                                │
-- │  docs: https://github.com/nvim-telescope/telescope.nvim                                │
-- │  setup: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt │
-- │  plugins: https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions             │
-- ╰────────────────────────────────────────────────────────────────────────────────────────╯
local telescope = loadModule("telescope", "plugin-configs");
local buildin   = loadModule("telescope.builtin", "plugin-configs");
local actions   = loadModule("telescope.actions", "plugin-configs");
local mappings  = require("keybindings").telescopeKeys(buildin, actions);

telescope.setup({
  defaults = {
    mappings             = mappings,     -- 快捷键
    selection_caret      = ' ',         -- 选择指示图标
    sorting_strategy     = "ascending",  -- 布局方式
    prompt_prefix        = '🔎',         -- 输入框前缀
    prompt_title         = false,        -- 输入框标题
    show_line            = false,
    border               = true,         -- 边框
    layout_strategy      = "horizontal", -- 布局
    layout_config        = {
      prompt_position = "top",           -- 输入框位置
    },
    file_ignore_patterns = {             -- 忽略目录
      "node_modules"
    }
  },
  pickers = {
    find_files = {
      previewer    = false,
      theme        = "dropdown",
      find_command = {
        "fd",
        "-H", -- -H: show hidden files
        "-I", -- -I: dont ignore `.gitignore` rules
      },
    },
    buffers    = {
      previewer = false,
      theme     = "dropdown",
    },
  }
});

-- 加载管理书签的插件
telescope.load_extension('vim_bookmarks')
