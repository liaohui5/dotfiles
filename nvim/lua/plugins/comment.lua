-----------------------------------------------------------------------
-- 合并/切分当前行(3个都可以)
-- 生成注释:https://github.com/danymat/neogen
-- 手动注释:https://github.com/numToStr/Comment.nvim
-- 块级注释:https://github.com/LudoPinelli/comment-box.nvim
-- 注释高亮:https://github.com/folke/todo-comments.nvim
-----------------------------------------------------------------------
return {
    {
        -- 自动生成注释
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        opts = {
            enable = true,
            snippet_engine = "luasnip",
            input_after_comment = true,
        },
        keys = {
            {
                "<leader>cc",
                function()
                    local types = { "type", "func", "file", "class" }
                    local options = {
                        prompt = "Please select generate comment type:",
                    }
                    vim.ui.select(types, options, function(selected)
                        require("neogen").generate({ type = selected })
                    end)
                end,
                desc = "auto generate comments",
            },
        },
    },
    {
        -- 手动注释插件
        "numToStr/Comment.nvim",
        event = "BufEnter",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            dependencies = "nvim-treesitter/nvim-treesitter",
            event = { "BufReadPost", "BufNewFile" },
        },
        opts = function(_, opts)
            local tscc = require("ts_context_commentstring.integrations.comment_nvim")
            local pre_hook = tscc.create_pre_hook()
            return vim.tbl_extend("force", opts, {
                padding = true,
                sticky = true,
                ignore = nil,
                mappings = { -- 禁止默认的快捷键
                    basic = false,
                    extra = false,
                },
                pre_hook = pre_hook,
                post_hook = nil,
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
        -- 块级注释
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
        -- 注释高亮: https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/plugins/editor.lua
        "folke/todo-comments.nvim",
        enable = true,
    },

    -- which key integration to comment-box
    {
        "folke/which-key.nvim",
        opts = {
            mode = "v",
            defaults = {
                ["<leader>cb"] = { name = "+comment-box" },
            },
        },
    },
}
