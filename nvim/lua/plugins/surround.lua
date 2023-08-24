-----------------------------------------------------------------------
-- 添加/删除/修改两边字符, 功能如这个 tpope/vim-surround 插件
-- docs: https://github.com/kylechui/nvim-surround
-- docs: https://github.com/echasnovski/mini.surround
-----------------------------------------------------------------------
return {
    {
        "echasnovski/mini.surround",
        version = "*",
        enabled = true,
        -- opts = {
        --     -- default key mappings
        --     -- mappings = {
        --     --     add            = "gza", -- Add surrounding in Normal and Visual modes
        --     --     delete         = "gzd", -- Delete surrounding
        --     --     find           = "gzf", -- Find surrounding (to the right)
        --     --     find_left      = "gzF", -- Find surrounding (to the left)
        --     --     highlight      = "gzh", -- Highlight surrounding
        --     --     replace        = "gzr", -- Replace surrounding
        --     --     update_n_lines = "gzn", -- Update `n_lines`
        --     -- },
        -- },
    },
    -- {
    --     "kylechui/nvim-surround",
    --     version = "*",
    --     event = "VeryLazy",
    --     enabled = false,
    --     keys = {
    --         {
    --             "gss",
    --             "<Plug>(nvim-surround-normal-cur)",
    --             desc = "add surround chars",
    --             mode = "x",
    --         },
    --         {
    --             "gsr",
    --             "<Plug>(nvim-surround-delete)",
    --             mode = "n",
    --             desc = "remove surround chars",
    --         },
    --         {
    --             "gsu",
    --             "<Plug>(nvim-surround-change)",
    --             mode = "n",
    --             desc = "update surround chars",
    --         },
    --         -- <Plug>(nvim-surround-insert)
    --         -- <Plug>(nvim-surround-insert-line)
    --         -- <Plug>(nvim-surround-normal)
    --         -- <Plug>(nvim-surround-normal-cur)
    --         -- <Plug>(nvim-surround-normal-line)
    --         -- <Plug>(nvim-surround-normal-cur-line)
    --         -- <Plug>(nvim-surround-visual)
    --         -- <Plug>(nvim-surround-visual-line)
    --         -- <Plug>(nvim-surround-delete)
    --         -- <Plug>(nvim-surround-change)
    --     },
    -- },
}
