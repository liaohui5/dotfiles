-----------------------------------------------------------------------
-- 合并/切分当前行(3个都可以)
-- github: https://github.com/Wansmer/treesj
-- github: https://github.com/bennypowers/splitjoin.nvim
-- github: https://github.com/AndrewRadev/splitjoin.vim
-- github: https://github.com/CKolkey/ts-node-action
-----------------------------------------------------------------------
return {
    "bennypowers/splitjoin.nvim",
    event = "VeryLazy",
    keys = {
        {
            "gJ",
            function()
                require("splitjoin").join()
            end,
            desc = "Join the object under cursor",
        },
        {
            "gS",
            function()
                require("splitjoin").split()
            end,
            desc = "Split the object under cursor",
        },
    },
}
