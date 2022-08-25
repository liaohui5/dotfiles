-----------------------------------------------------------
-- 搜索文件/buffer/字符串
-- docs: https://github.com/nvim-telescope/telescope.nvim
-- plugins: https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
-----------------------------------------------------------
return {
  onstart = function(telescope)
    telescope.setup({
      defaults = {
        layout_strategy = "horizontal", -- vertical | horizontal
        layout_config = {
          prompt_position = "top", -- top | bottom
        },
        -- 绑定快捷键
        mappings = require("keybindings").telescopeKeys(),
        file_ignore_patterns = {
          "node_modules"
        }
      },
      pickers = {
        find_files = {
          previewer = false,
          theme = "dropdown",
        },
        buffers = {
          previewer = false,
          theme = "dropdown",
        },
        recent_projects = { -- nvim_projects plugins
          previewer = false,
          theme = "dropdown",
        }
      }
    });

    -- 加载管理书签的插件
    telescope.load_extension('vim_bookmarks')
  end
}
