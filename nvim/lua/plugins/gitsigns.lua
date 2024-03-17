-----------------------------------------------------------------------
-- git 状态显示插件
-- docs: https://github.com/lewis6991/gitsigns.nvim
-----------------------------------------------------------------------
return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
        yadm = {
          enable = false,
        },
    },
    keys = {
        {
            "<leader>gf",
            "<cmd>Gitsigns refresh<cr>",
            desc = "refresh gitsigns",
        },
        {
            "<leader>gu",
            "<cmd>Gitsigns undo_stage_hunk<cr>",
            desc = "undo current hunk",
        },
        {
            "<leader>gr",
            "<cmd>Gitsigns reset_hunk<cr>",
            desc = "reset current hunk",
        },
        {
            "<leader>gR",
            "<cmd>Gitsigns reset_buffer<cr>",
            desc = "reset buffer all hunk",
        },
        {
            "<leader>gs",
            "<cmd>Gitsigns stage_hunk<cr>",
            desc = "stage current hunk",
        },
        {
            "<leader>gS",
            "<cmd>Gitsigns stage_buffer<cr>",
            desc = "stage buffer all hunk",
        },
        {
            "<leader>gd",
            "<cmd>Gitsigns diffthis<cr>",
            desc = "diff hunks",
        },
        {
            "<leader>gj",
            "<cmd>Gitsigns next_hunk<cr>",
            desc = "next hunk",
        },
        {
            "<leader>gk",
            "<cmd>Gitsigns prev_hunk<cr>",
            desc = "previous hunk",
        },
    },
}
