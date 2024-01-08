-----------------------------------------------------------------------
-- 基于 treesitter 提供一些便捷操作
-- github: https://github.com/CKolkey/ts-node-action
---- 快速切换 true/false 值
---- 快速切换 小驼峰/大驼峰格式
---- 快速切分合并一行多行(类似: https://github.com/Wansmer/treesj)
-----------------------------------------------------------------------
return {
    "ckolkey/ts-node-action",
    enabled = false,
    opts = {},
    dependencies = {
        "nvim-treesitter",
    },
    keys = {
        { "ga", "<cmd>NodeAction<cr>", desc = "Trigger Node Action" },
    },
}
