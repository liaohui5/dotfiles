-----------------------------------------------------------------------
-- 代码格式化
-- https://www.lazyvim.org/plugins/formatting
-----------------------------------------------------------------------
return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    { "<leader>cF", false },
    {
      "<leader>cf",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
}
