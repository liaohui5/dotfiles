-----------------------------------------------------------------------
-- 代码对齐
-- github: https://github.com/Vonr/align.nvim
-----------------------------------------------------------------------
return {
    "Vonr/align.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>aa",
            "<cmd>lua require('align').align_to_string(false,true,false)<cr>",
            desc = "align by string",
            mode = "v",
        },
        {
            "<leader>aA",
            "<cmd>lua require('align').align_to_char(1,true,false)<cr>",
            desc = "align by char",
            mode = "v",
        },
        {
            "<leader>ap",
            "<cmd>lua require('align').align_to_string(false,true,true)<cr>",
            desc = "align by string(preview)",
            mode = "v",
        },
        {
            "<leader>ar",
            "<cmd>lua require('align').align_to_string(true,true,true)<cr>",
            desc = "align by string or pattern(preview)",
            mode = "v",
        },
    },
}
