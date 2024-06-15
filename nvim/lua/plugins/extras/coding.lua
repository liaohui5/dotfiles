return {
  {
    -- add which key menu for `yanky.nvim` and `project.nvim`
    "folke/which-key.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        defaults = {
          ["<leader>p"] = {
            name = "+project/yank",
          },
        },
      })
    end,
  },
  {
    "gbprod/yanky.nvim",
    keys = {
      { "<leader>p", false },
      {
        "<leader>pp",
        function()
          if LazyVim.pick.picker.name == "telescope" then
            require("telescope").extensions.yank_history.yank_history({})
          else
            vim.cmd([[YankyRingHistory]])
          end
        end,
        desc = "Open Yank History",
      },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    opts = function(_, opts)
      vim.tbl_deep_extend("force", opts, {
        exclude_dirs = {
          ".cargo/*",
          "node_modules/*",
        },
      })
    end,
    keys = {
      {
        "<leader>ps",
        "<cmd>ProjectRoot<cr>",
        desc = "Save project",
      },
    },
  },
}
