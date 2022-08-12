-----------------------------------------------------------
-- 搜索文件/buffer/字符串
-- docs: https://github.com/nvim-telescope/telescope.nvim
-----------------------------------------------------------
return {

  -- TODO:添加书签插件
  -- https://github.com/MattesGroeger/vim-bookmarks
  -- https://github.com/tom-anders/telescope-vim-bookmarks.nvim
  onstart = function(telescope)
    telescope.setup({
      defaults = {
        layout_strategy = "horizontal", -- vertical | horizontal
        layout_config = {
          prompt_position = "top", -- top | bottom
        },
        -- mappings = {
        --   i = {
        --     ["<C-j>"] = actions.move_selection_next,
        --     ["<C-k>"] = actions.move_selection_previous,
        --   }
        -- },
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
  end
}
