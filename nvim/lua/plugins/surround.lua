-----------------------------------------------------------------------
-- 添加/删除/修改两边字符, 功能如这个 tpope/vim-surround 插件
-- docs: https://github.com/kylechui/nvim-surround
-- docs: https://github.com/echasnovski/mini.surround
-----------------------------------------------------------------------
return {
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        enabled = true,
        opts = function(_, opts)
            return vim.tbl_deep_extend("force", opts, {
                -- disabled default keybindings
                keymaps = {
                    insert = false,
                    insert_line = false,
                    normal = false,
                    normal_cur = false,
                    normal_line = false,
                    normal_cur_line = false,
                    visual = false,
                    visual_line = false,
                    delete = false,
                    change = false,
                    change_line = false,
                },
            })
        end,
        keys = {
            -- mode: actions that plugins can perform
            -- i: <Plug>(nvim-surround-insert)
            -- i: <Plug>(nvim-surround-insert-line)
            -- v: <Plug>(nvim-surround-visual)
            -- v: <Plug>(nvim-surround-visual-line)
            -- n: <Plug>(nvim-surround-delete)
            -- n: <Plug>(nvim-surround-change)
            -- n: <Plug>(nvim-surround-normal)
            -- n: <Plug>(nvim-surround-normal-cur)
            -- n: <Plug>(nvim-surround-normal-line)
            -- n: <Plug>(nvim-surround-normal-cur-line)
            {
                "gss",
                "<Plug>(nvim-surround-visual)",
                desc = "add surround character",
                mode = "v",
            },
            {
                "gsl",
                "<Plug>(nvim-surround-visual-line)",
                desc = "add surround character",
                mode = "v",
            },
            {
                "gss",
                "<Plug>(nvim-surround-normal)",
                desc = "add surround character with range",
            },
            {
                "gsl",
                "<Plug>(nvim-surround-normal-cur-line)",
                desc = "add current line surround character",
            },
            {
                "gsL",
                "<Plug>(nvim-surround-normal-line)",
                desc = "add lines surround character with range",
            },
            {
                "gsd",
                "<Plug>(nvim-surround-delete)",
                desc = "remove surround character",
            },
            {
                "gsu",
                "<Plug>(nvim-surround-change)",
                desc = "update surround character",
            },
        },
    },
}
