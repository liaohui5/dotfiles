----------------------------------------------------
-- 侧边栏目录树
-- docs: https://github.com/kyazdani42/nvim-tree.lua
----------------------------------------------------
local config = {};

-- 现在改用 rnvimr, 这个插件已经禁用, 因为功能类似
-- 如果要启用这个插件, 在 plugins/index 中启用,
-- 但是, 需要注意和 rnvimr 快捷键冲突 <C-t>

config.onstart = function(nvimtree)
  nvimtree.setup({
    disable_netrw = true,
    hijack_netrw  = true,
    open_on_setup = false,
    update_cwd    = true,
    git = {
      enable = false,
    },
    update_focused_file = {
      enable     = true,
      update_cwd = true,
    },
    filters = {
      dotfiles = false,
      custom   = { "node_modules" },
    },
    filesystem_watchers = {
      enable = true,
    },
    view = {
      width            = 32,
      side             = "left",
      hide_root_folder = true,
      mappings = {
        custom_only = true,
        list        = require("keybindings").nvimtreeKeys(), -- 绑定快捷键
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes",
    },
    actions = {
      open_file = {
        resize_window = false,
        quit_on_open  = false,
      },
    },
    system_open = {
      cmd = "open",
    },
    renderer = {
      highlight_git          = false,
      highlight_opened_files = "none",
      indent_markers         = {
        enable = false,
      },
      icons = {
        show = {
          file         = true,
          folder       = true,
          folder_arrow = false,
          git          = false,
        },
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            default      = "",
            empty        = "",
            empty_open   = "",
            open         = "",
            symlink      = "",
            symlink_open = "",
            arrow_open   = "",
            arrow_closed = "",
          },
          git = {
            unstaged  = "✗",
            staged    = "✓",
            unmerged  = "",
            renamed   = "➜",
            untracked = "★",
            deleted   = "",
            ignored   = "◌",
          },
        },
      },
    },
  });

  -- 创建文件时, 自动编辑这个文件
  require("nvim-tree.events").on_file_created(function(file) vim.cmd("edit " .. file.fname) end);
end

return config;
