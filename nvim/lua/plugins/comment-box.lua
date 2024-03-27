-----------------------------------------------------------------------
-- 快速生成块级注释插件
-- https://github.com/LudoPinelli/comment-box.nvim
-----------------------------------------------------------------------
return {
  {
    "LudoPinelli/comment-box.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
      line_width = 80,
      doc_width = 80,
      box_width = 80,
      outer_blank_lines = false,
      inner_blank_lines = false,
      line_blank_line_above = false,
      line_blank_line_below = false,
    },
    keys = {
      {
        "<leader>cb1",
        [[<cmd>CBllbox<cr>]],
        desc = "text:left length:fixed",
        mode = "v",
      },
      {
        "<leader>cb2",
        [[<cmd>CBlcbox<cr>]],
        desc = "text:center length:fixed",
        mode = "v",
      },
      {
        "<leader>cb3",
        [[<cmd>CBlrbox<cr>]],
        desc = "text:center length:fixed",
        mode = "v",
      },
      {
        "<leader>cb4",
        [[<cmd>CBalbox<cr>]],
        desc = "text:left length:auto",
        mode = "v",
      },
      {
        "<leader>cb5",
        [[<cmd>CBacbox<cr>]],
        desc = "text:center length:auto",
        mode = "v",
      },
      {
        "<leader>cb6",
        [[<cmd>CBarbox<cr>]],
        desc = "text:left length:auto",
        mode = "v",
      },
    },
  },
  {
    -- which key integration to comment-box
    "folke/which-key.nvim",
    opts = {
      mode = "v",
      defaults = {
        ["<leader>cb"] = { name = "+comment-box" },
      },
    },
  },
}
