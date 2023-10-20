--------------------------------------------------------------------
-- 多文件图形化搜索/替换, nvim-spectre 这个插件需要两个依赖命令
-- https://github.com/nvim-pack/nvim-spectre
-- 依赖命令:
-- https://github.com/BurntSushi/ripgrep
-- https://www.gnu.org/software/sed/
--------------------------------------------------------------------
-- 也可以使用这个插件, 没有依赖命令, 但是这个插件多文件搜索不方便
-- https://github.com/roobert/search-replace.nvim
--------------------------------------------------------------------
return {
    {
        "roobert/search-replace.nvim",
        event = "VeryLazy",
        opts = {
            default_replace_single_buffer_options = "gcI",
            default_replace_multi_buffer_options = "egcI",
        },
        keys = {
            {
                "<leader>rr",
                "<cmd>SearchReplaceSingleBufferOpen<cr>",
                desc = "Replace in current buffer",
            },
            {
                "<leader>rr",
                "<cmd>SearchReplaceWithinVisualSelection<cr>",
                desc = "Replace in current buffer",
                mode = "v",
            },
        },
    },
    {
        "nvim-pack/nvim-spectre",
        event = "VeryLazy",
        opts = {
        -- stylua: ignore start
        color_devicons     = true,
        live_update        = true,
        open_cmd           = "noswapfile vnew", -- 'vnew' | 'split new',
        replace_vim_cmd    = "cdo",
        is_open_target_win = true,
        is_insert_mode     = false, -- 打开替换窗口默认模式
        line_sep_start     = "╭───────────────────────────────────────────────────────────",
        result_padding     = "│ ➜ ",
        line_sep           = "╰───────────────────────────────────────────────────────────",
        },
        keys = {
            { "<leader>sr", false },
            -- {
            --     -- 由于这个命令有问题: 搜索不出来结果, 所以改用 search-replace.nvim
            --     "<leader>rr",
            --     "<cmd>Spectre %<cr>",
            --     desc = "Replace in current file(Spectre)",
            -- },
            {
                "<leader>rR",
                "<cmd>Spectre<cr>",
                desc = "Replace in all files",
                remap = true,
            },
        },
    },
}
