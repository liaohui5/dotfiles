----------------------------------------------------------------
-- 快速搜索插件
-- github: https://github.com/nvim-telescope/telescope.nvim
----------------------------------------------------------------
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")
    return vim.tbl_deep_extend("force", opts, {
      defaults = {
        mappings = {
          i = { -- 插入模式快捷键
            ["<c-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,
            ["<c-n>"] = actions.cycle_history_next,
            ["<c-p>"] = actions.cycle_history_prev,
          },
        },
        selection_caret = " ", -- 选择指示图标
        prompt_prefix = "🔭 ", -- 输入框前缀
        prompt_title = false, -- 输入框标题
        border = true, -- 边框
        layout_strategy = "horizontal", -- 布局
        sorting_strategy = "ascending", -- 布局方式
        layout_config = {
          prompt_position = "top", -- 输入框位置
        },
        file_ignore_patterns = { -- 忽略目录
          "**node_modules",
          "**.git",
        },
      },
      pickers = {
        find_files = {
          prompt_title = false,
          previewer = false,
          find_command = {
            "fd",     -- 需要安装命令: https://github.com/chinanf-boy/fd-zh
            "-H",     -- -H: show hidden files
            "-I",     -- -I: dont ignore `.gitignore` rules
            "--type",
            "file",   -- --type file & symlink 仅显示文件和软连接,不显示目录
            "--type", -- 更多选项: https://github.com/chinanf-boy/fd-zh
            "symlink",
            "--strip-cwd-prefix",
          },
        },
      },
    })
  end,
  keys = function(_, keys)
    return vim.list_extend(keys, {
      { "<C-p>",      "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
      { "<leader>ff", "<cmd>write<cr>",           desc = "Save current file" },
    })
  end,
}
