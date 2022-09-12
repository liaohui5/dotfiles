-- ╭────────────────────────────────────────────────────────────────────────────────────────╮
-- │  搜索文件/buffer/字符串                                                                │
-- │  docs: https://github.com/nvim-telescope/telescope.nvim                                │
-- │  setup: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt │
-- │  plugins: https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions             │
-- ╰────────────────────────────────────────────────────────────────────────────────────────╯
local telescope        = loadModule("telescope", "plugin-configs");
local telescopeBuiltin = loadModule("telescope.builtin", "plugin-configs");
local telescopeActions = loadModule("telescope.actions", "plugin-configs");
local mappings         = require("keybindings").telescopeKeys(telescopeBuiltin, telescopeActions);

telescope.setup({
  defaults = {
    mappings             = mappings,
    selection_caret      = ' ',
    layout_strategy      = "horizontal",
    sorting_strategy     = "ascending",
    prompt_title         = '',
    layout_config        = {
      prompt_position = "top",
    },
    file_ignore_patterns = {
      "node_modules"
    }
  },
  pickers = {
    find_files     = {
      previewer    = false,
      theme        = "dropdown",
      find_command = {
        "fd",
        "-H", -- -H: show hidden files
        "-I", -- -I: dont ignore `.gitignore` rules
      },
    },
    buffers = {
      previewer = false,
      theme     = "dropdown",
    },
  }
});

-- 加载管理书签的插件
telescope.load_extension('vim_bookmarks')
