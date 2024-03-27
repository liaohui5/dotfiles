-----------------------------------------------------------------------
-- 代码格式化
-- https://www.lazyvim.org/plugins/formatting
-----------------------------------------------------------------------
return {
  {
    "stevearc/conform.nvim",
    enabled = true,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- install formatters
      table.insert(opts.ensure_installed, "stylua")
      table.insert(opts.ensure_installed, "shfmt")
    end,
  },
}
