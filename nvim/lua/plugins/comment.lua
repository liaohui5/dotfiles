-----------------------------------------------------------------------
-- 合并/切分当前行(3个都可以)
-- 生成注释:https://github.com/danymat/neogen
-- 手动注释:https://github.com/numToStr/Comment.nvim
-- 块级注释:https://github.com/LudoPinelli/comment-box.nvim
-- 注释高亮:https://github.com/folke/todo-comments.nvim
-----------------------------------------------------------------------
return {
    -- highlight some comments: https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/plugins/editor.lua#L492
    -- "folke/todo-comments.nvim",
    {
        -- comment
        "numToStr/Comment.nvim",
        event = "BufEnter",
        opts = function(_, opts)
            return vim.tbl_extend("force", opts, {
                padding = true,
                sticky = true,
                mappings = {
                    -- 禁止使用默认的快捷键
                    basic = false,
                    extra = false,
                },
            })
        end,
        keys = {
            {
                "<c-\\>",
                "<Plug>(comment_toggle_linewise_visual)<c-c>gv-gv",
                desc = "toggle comment in selection",
                mode = "v",
            },
            {
                "<c-\\>",
                "<Plug>(comment_toggle_linewise_current)",
                desc = "toggle comment",
                mode = "n",
            },
        },
    },
    {
        -- comment box
        "LudoPinelli/comment-box.nvim",
        event = "VeryLazy",
        opts = {
            line_width = 80,
            doc_width = 80,
            box_width = 80,
            outer_blank_lines = false,
            inner_blank_lines = false,
            line_blank_line_above = false,
            line_blank_line_below = false,
        },
        keys = {
            {
                "<leader>cb1",
                [[<cmd>CBllbox<cr>]],
                desc = "text:left length:fixed",
                mode = "v",
            },
            {
                "<leader>cb2",
                [[<cmd>CBlcbox<cr>]],
                desc = "text:center length:fixed",
                mode = "v",
            },
            {
                "<leader>cb3",
                [[<cmd>CBlrbox<cr>]],
                desc = "text:center length:fixed",
                mode = "v",
            },
            {
                "<leader>cb4",
                [[<cmd>CBalbox<cr>]],
                desc = "text:left length:auto",
                mode = "v",
            },
            {
                "<leader>cb5",
                [[<cmd>CBacbox<cr>]],
                desc = "text:center length:auto",
                mode = "v",
            },
            {
                "<leader>cb6",
                [[<cmd>CBarbox<cr>]],
                desc = "text:left length:auto",
                mode = "v",
            },
        },
    },
    {
        -- which key integration to comment-box
        "folke/which-key.nvim",
        opts = {
            mode = "v",
            defaults = {
                ["<leader>cb"] = { name = "+comment-box" },
            },
        },
    },
}
