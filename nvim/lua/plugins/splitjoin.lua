-----------------------------------------------------------------------
-- 合并/切分当前行(这几个都可以)
-- github: https://github.com/Wansmer/treesj
-- github: https://github.com/bennypowers/splitjoin.nvim
-- github: https://github.com/AndrewRadev/splitjoin.vim
-- github: https://github.com/CKolkey/ts-node-action
-----------------------------------------------------------------------
return {
    "https://github.com/Wansmer/treesj",
    event = "VeryLazy",
    opts = {
        use_default_keymaps = false,
    },
    keys = function()
        local splitJoin = require("treesj")
        return {
            { "gJ", splitJoin.join, desc = "Join the object under cursor" },
            { "gS", splitJoin.split, desc = "Split the object under cursor" },
        }
    end,
}
