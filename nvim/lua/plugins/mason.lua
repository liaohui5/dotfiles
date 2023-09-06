-----------------------------------------------------------------------
-- 外部包安装管理器
-- github  : https://github.com/williamboman/mason.nvim
-- packages: https://mason-registry.dev/registry/list
-----------------------------------------------------------------------

return {
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
}
