-------------------------------------------------------------------------------
-- 快速移动
-- https://github.com/folke/flash.nvim
-------------------------------------------------------------------------------
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        rainbow = {
            enabled = true,
        },
        highlight = {
            matches = true,
        },
    },
    keys = {
        {
            "<leader>ll",
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "^",
                })
            end,
            mode = "n",
            desc = "jump to line",
        },
    },
}
