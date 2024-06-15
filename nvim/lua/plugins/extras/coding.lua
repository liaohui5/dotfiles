return {
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
    keys = {
      {
        "<c-/>",
        "gcc",
        mode = "n",
        remap = true,
      },
    },
  },
  {
    "gbprod/yanky.nvim",
    recommended = true,
    desc = "Better Yank/Paste",
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
      {
        "<leader>pC",
        "<cmd>YankClearHistory<cr>",
        desc = "Clear yank history",
        mode = "n",
      },
    },
  },
}
