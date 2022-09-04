----------------------------------------------------
-- 侧边栏目录树
-- docs: https://github.com/kyazdani42/nvim-tree.lua
----------------------------------------------------
local config = {}

-- 现在改用 rnvimr, 这个插件已经禁用, 因为功能类似
-- 如果要启用这个插件, 在 plugins/index 中启用,
-- 但是, 需要注意和 rnvimr 快捷键冲突 <C-t>

config.onstart = function(nvimtree)
  nvimtree.setup({
    open_on_setup = false, -- 启动时直接打开
    disable_netrw = true,
    hijack_netrw = true,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    log = { enable = false },
    git = {
      enable = false,
      ignore = true,
      timeout = 400,
      show_on_dirs = false,
    },
    filters = {
      dotfiles = false,
      custom = {},
      exclude = { "node_modules" },
    },
    filesystem_watchers = {
      enable = true,
      debounce_delay = 100,
    },
    actions = {
      open_file = {
        resize_window = false,
        quit_on_open = false,
      },
    },
    system_open = {
      cmd = "open",
    },
    view = {
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      width = 32,
      side = "left",
      hide_root_folder = true,
      mappings = {
        custom_only = true,
        list = require("keybindings").nvimtreeKeys(), -- 绑定快捷键
      },
    },
    renderer = {
      highlight_git = true,
      highlight_opened_files = "none",
      indent_markers = {
        enable = false,
      },
      icons = {
        webdev_colors = true,
        show = {
          file = true,
          folder = true,
          folder_arrow = false,
          git = true,
        },
        glyphs = {
          default = "",
          symlink = "",
        },
      },
    },
  })

  -- 创建文件时, 自动编辑这个文件
  require("nvim-tree.events").on_file_created(function(file) vim.cmd("edit " .. file.fname) end)
end

return config
