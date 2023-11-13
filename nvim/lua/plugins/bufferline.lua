-------------------------------------------------------------------
-- 顶部 buffer 栏目(类似bufferline)
-- barbar     : https://github.com/romgrk/barbar.nvim
-- bufferline : https://github.com/akinsho/bufferline.nvim
-------------------------------------------------------------------
return {
    {
        "echasnovski/mini.bufremove",
        keys = {
            { "<leader>bD", false },
        },
    },
    {
        "akinsho/bufferline.nvim",
        opts = function(_, opts)
            return vim.tbl_deep_extend("force", opts, {
                options = {
                    always_show_bufferline = false, -- 如果为真在启动页也会显示,会破坏启动页的样式
                    offsets = {
                        {
                            filetype = "neo-tree", -- neotree
                            highlight = "Directory",
                            text = "Explorer",
                            text_align = "center", -- "left" | "center" | "right"
                        },
                    },
                },
            })
        end,
        keys = {
            {
                "<leader>qH",
                "<cmd>BufferLineCloseLeft<cr>",
                desc = "close left buffers",
            },
            {
                "<leader>qL",
                "<cmd>BufferLineCloseRight<cr>",
                desc = "close right buffers",
            },
            {
                "<leader>bD",
                "<cmd>BufferLineCloseOthers<cr>",
                desc = "close other buffers",
            },
            {
                "<leader>bh",
                "<cmd>BufferLineMovePrev<cr>",
                desc = "move to left",
            },
            {
                "<leader>bl",
                "<cmd>BufferLineMoveNext<cr>",
                desc = "move to right",
            },
            {
                "<s-h>",
                "<cmd>BufferLineCyclePrev<cr>",
                desc = "previous tab",
            },
            {
                "<s-l>",
                "<cmd>BufferLineCycleNext<cr>",
                desc = "next tab",
            },
        },
    },
}
