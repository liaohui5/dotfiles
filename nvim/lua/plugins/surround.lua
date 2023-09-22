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
                "gzz",
                "<Plug>(nvim-surround-visual)",
                desc = "add surround character",
                mode = "v",
            },
            {
                "gzl",
                "<Plug>(nvim-surround-visual-line)",
                desc = "add surround character",
                mode = "v",
            },
            {
                "gzz",
                "<Plug>(nvim-surround-normal)",
                desc = "add surround character with range",
            },
            {
                "gzl",
                "<Plug>(nvim-surround-normal-cur-line)",
                desc = "add current line surround character",
            },
            {
                "gzL",
                "<Plug>(nvim-surround-normal-line)",
                desc = "add lines surround character with range",
            },
            {
                "gzd",
                "<Plug>(nvim-surround-delete)",
                desc = "remove surround character",
            },
            {
                "gzu",
                "<Plug>(nvim-surround-change)",
                desc = "update surround character",
            },
        },
    },
    -- {
    --     "echasnovski/mini.surround",
    --     version = "*",
    --     enabled = false,
    --     keys = function(_, keys)
    --         return vim.list_extend(keys, {
    --             {
    --                 "gzz",
    --                 "gza",
    --                 mode = "v",
    --                 remap = true,
    --                 desc = "add surrounding",
    --             },
    --         })
    --     end,
    --     -- opts = {
    --     --     -- LazyVim default surround keys
    --     --     -- https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/plugins/coding.lua#L126
    --     --     -- mappings = {
    --     --     --     add            = "gza", -- add surrounding in normal and visual modes
    --     --     --     delete         = "gzd", -- delete surrounding
    --     --     --     find           = "gzf", -- find surrounding (to the right)
    --     --     --     find_left      = "gzf", -- find surrounding (to the left)
    --     --     --     highlight      = "gzh", -- highlight surrounding
    --     --     --     replace        = "gzr", -- replace surrounding
    --     --     --     update_n_lines = "gzn", -- update `n_lines`
    --     --     -- },
    --     -- },
    -- },
}
