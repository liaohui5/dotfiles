--------------------------------------------------------------
-- LazyVIM 内置增强工具
-- https://www.lazyvim.org/plugins/util
--------------------------------------------------------------
return {
  { "nvim-lua/plenary.nvim", enabled = true },
  { "folke/persistence.nvim", enabled = false },
  {
    -- session 管理插件(替换folke/persistence.nvim)
    "Shatur/neovim-session-manager",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    opts = function()
      local config = require("session_manager.config")
      local Path = require("plenary.path")
      local sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions")

      -- session autoload mode: Disabled, CurrentDir, LastSession
      local autoload_mode = config.AutoloadMode.Disabled
      return {
        sessions_dir = sessions_dir,
        autoload_mode = autoload_mode,
        path_replacer = "__",
        colon_replacer = "++",
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_only_in_session = true,
        max_path_length = 80,
        autosave_ignore_filetypes = {
          ".DS_Store",
          "gitcommit",
        },
      }
    end,
    keys = {
      {
        "<leader>pr",
        "<cmd>SessionManager load_last_session<cr>",
        desc = "Load last session",
      },
      {
        "<leader>pc",
        "<cmd>SessionManager load_current_dir_session<cr>",
        desc = "Load current session",
      },
      {
        "<leader>pl",
        "<cmd>SessionManager load_session<cr>",
        desc = "Pick sessions",
      },
      {
        "<leader>pd",
        "<cmd>SessionManager delete_session<cr>",
        desc = "Delete sessions",
      },
      {
        "<leader>ps",
        "<cmd>SessionManager save_current_session<cr>",
        desc = "Save sessions",
      },
    },
  },
}
