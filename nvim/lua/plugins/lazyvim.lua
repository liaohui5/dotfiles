---------------------------------------------------------------------------------
-- 配置 LazyVim 内置的一些内容, 比如可以禁用默认的 autocmds 和 keymaps
-- https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/config/autocmds.lua
-- https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/config/keymaps.lua#L43
---------------------------------------------------------------------------------
return {
  "LazyVim/LazyVim",
  opts = {
    autocmds = true, -- load lazyvim autocmds
    keymaps = true, --- load lazyvim keymaps
  },
  dependencies = {
    "folke/which-key.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        defaults = {
          ["<leader>l"] = { name = "+lazy" },
        },
      })
    end,
  },
  keys = {
    {
      "<leader>lz",
      "<cmd>Lazy<cr>",
      desc = "LazyVim",
      mode = "n",
    },
    {
      "<leader>le",
      "<cmd>LazyExtra<cr>",
      desc = "LazyExtra",
      mode = "n",
    },
    {
      "<leader>lh",
      "<cmd>LazyHealth<cr>",
      desc = "LazyHealth",
      mode = "n",
    },
  },
}
