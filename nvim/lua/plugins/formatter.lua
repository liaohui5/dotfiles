-----------------------------------------------------------------------
-- 格式化代码插件安装
-- mason.nvim      : https://github.com/williamboman/mason.nvim
-- mason-registry  : https://mason-registry.dev/registry/list
-- null-ls-builtin : https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
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
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local formatting = require("null-ls").builtins.formatting
            return vim.tbl_deep_extend("force", opts, {
                sources = {
                    formatting.stylua,
                    formatting.shfmt,
                    formatting.prettierd
                },
            })
        end,
    },
}
