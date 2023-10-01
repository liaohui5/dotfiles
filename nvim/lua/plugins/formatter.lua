-----------------------------------------------------------------------
-- 格式化代码插件安装
-- mason.nvim      : https://github.com/williamboman/mason.nvim
-- mason-registry  : https://mason-registry.dev/registry/list
-- none-ls builtin : https://github.com/nvimtools/none-ls.nvim
-----------------------------------------------------------------------
return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            return vim.tbl_deep_extend("force", opts, {
                ensure_installed = {
                    "stylua",
                    "shfmt",
                    "prettierd",
                },
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local formatting = require("null-ls").builtins.formatting
            return vim.tbl_deep_extend("force", opts, {
                sources = {
                    formatting.stylua,
                    formatting.shfmt,
                    formatting.prettierd,
                },
            })
        end,
    },
}
