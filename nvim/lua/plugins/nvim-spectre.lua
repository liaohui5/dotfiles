--------------------------------------------------------------
-- 多文件搜索/替换,有 UI 界面
-- https://github.com/nvim-pack/nvim-spectre
-- 注意: nvim-spectre 这个插件需要两个依赖命令
-- https://github.com/BurntSushi/ripgrep
-- https://www.gnu.org/software/sed/
-- 也可以使用这个插件, 不用安装任何依赖命令
-- https://github.com/roobert/search-replace.nvim
--------------------------------------------------------------
return {
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
        {
            "<leader>rr",
            "<cmd>Spectre %<cr>",
            desc = "Replace in current file(Spectre)",
        },
        {
            "<leader>rR",
            "<cmd>Spectre<cr>",
            desc = "Replace in all files(Spectre)",
            remap = true,
        },
    },
}
