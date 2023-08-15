-------------------------------------------------------------------------------
-- 改进默认的UI样式
-- https://github.com/stevearc/dressing.nvim
-------------------------------------------------------------------------------
return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
        input = {
            mapping = {
                n = {
                    ["<c-c>"] = "Close",
                    ["<cr>"] = "Confirm",
                },
                i = {
                    ["<c-c>"] = "Close",
                    ["<cr>"] = "Confirm",
                    ["<Up>"] = "HistoryPrev",
                    ["<Down>"] = "HistoryNext",
                },
            },
        },
    },
}
