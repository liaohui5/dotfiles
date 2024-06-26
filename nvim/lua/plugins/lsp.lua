-----------------------------------------------------------------------
-- language server protocol
-- https://www.lazyvim.org/plugins/lsp
-----------------------------------------------------------------------
return {
  { "folke/neoconf.nvim", enabled = true },
  { "folke/neodev.nvim", enabled = true },
  { "williamboman/mason.nvim", enabled = true },
  { "williamboman/mason-lspconfig.nvim", enabled = true },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      table.insert(keys, {
        "<leader>rn",
        "<leader>cr",
        desc = "Rename Symbol",
        mode = { "n", "v" },
        remap = true,
        silent = true,
      })
      table.insert(keys, {
        "gh",
        "gK",
        desc = "LSP hover",
        mode = { "n", "v" },
        remap = true,
        silent = true,
      })
    end,
    opts = {
      servers = {
        emmet_language_server = {
          -- better html/css support
          filetypes = {
            "html",
            "css",
            "less",
            "sass",
            "scss",
            "pug",
            "vue",
            "javascriptreact",
            "typescriptreact",
          },
        },
      },
    },
  },
}
