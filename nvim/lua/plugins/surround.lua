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
        keys = function(_, keys)
            return vim.list_extend(keys, {
                {
                    "gzz",
                    "gza",
                    mode = "v",
                    remap = true,
                    desc = "add surrounding",
                },
            })
        end,
        -- opts = {
        --     -- LazyVim default surround keys
        --     -- https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/plugins/coding.lua#L126
        --     -- mappings = {
        --     --     add            = "gza", -- add surrounding in normal and visual modes
        --     --     delete         = "gzd", -- delete surrounding
        --     --     find           = "gzf", -- find surrounding (to the right)
        --     --     find_left      = "gzf", -- find surrounding (to the left)
        --     --     highlight      = "gzh", -- highlight surrounding
        --     --     replace        = "gzr", -- replace surrounding
        --     --     update_n_lines = "gzn", -- update `n_lines`
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
