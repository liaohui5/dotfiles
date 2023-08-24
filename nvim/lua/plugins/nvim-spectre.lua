--------------------------------------------------------------
-- 多文件搜索/替换,有 UI 界面
-- github : https://github.com/nvim-treesitter/nvim-treesitter
-- 也可以使用不依赖外部命令的 "roobert/search-replace.nvim",
--------------------------------------------------------------
-- stylua: ignore start
return {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    opts = {
        color_devicons     = true,
        live_update        = true,
        open_cmd           = "noswapfile vnew", -- 'vnew' | 'split new',
        replace_vim_cmd    = "cdo",
        is_open_target_win = true,
        is_insert_mode     = false, -- 打开替换窗口默认模式
        line_sep_start     = "╭───────────────────────────────────────────────────────────",
        result_padding     = "│ ➜ ",
        line_sep           = "╰───────────────────────────────────────────────────────────",
        mapping            = {
            ['toggle_line'] = {
                map  = "<leader>rt",
                cmd  = "<cmd>lua require('spectre').toggle_line()<cr>",
                desc = "delete current item"
            },
            ['enter_file'] = {
                map  = "o",
                cmd  = "<cmd>lua require('spectre.actions').select_entry()<cr>",
                desc = "goto current file"
            },
            ['send_to_qf'] = {
                map  = "<leader>rq",
                cmd  = "<cmd>lua require('spectre.actions').send_to_qf()<cr>",
                desc = "send all item to quickfix"
            },
            ['show_option_menu'] = {
                map  = "<leader>ro",
                cmd  = "<cmd>lua require('spectre').show_options()<cr>",
                desc = "show option"
            },
            ['run_current_replace'] = {
                map  = "<Enter>",
                cmd  = "<cmd>lua require('spectre.actions').run_current_replace()<cr>",
                desc = "replace current item"
            },
            ['run_replace'] = {
                map  = "<leader>ra",
                cmd  = "<cmd>lua require('spectre.actions').run_replace()<cr>",
                desc = "replace all"
            }
        }
    },
    keys = {
        { "<leader>rr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    }
}
