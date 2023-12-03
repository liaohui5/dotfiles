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
            -- install formatter
            table.insert(opts.ensure_installed, "prettier")
            table.insert(opts.ensure_installed, "stylua")
            table.insert(opts.ensure_installed, "shfmt")
        end,
    },
}
