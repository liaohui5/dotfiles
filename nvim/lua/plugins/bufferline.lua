-------------------------------------------------------------------
-- 顶部 buffer 栏目(类似bufferline)
-- barbar     : https://github.com/romgrk/barbar.nvim
-- bufferline : https://github.com/akinsho/bufferline.nvim
-------------------------------------------------------------------
return {
    {
        "echasnovski/mini.bufremove",
        -- stylua: ignore
        keys = {
            { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
            { "<leader>bD", false },
        },
    },
    {
        "akinsho/bufferline.nvim",
        opts = function(_, opts)
            return vim.tbl_deep_extend("force", opts, {
                options = {
                    always_show_bufferline = false, -- if true, it whill be display to alpha when start neovim
                    mode = "buffers", -- "tabs" | "buffers"
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
                "<leader>bD",
                false,
            },
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
    -- {
    --     "romgrk/barbar.nvim",
    --     enabled = false,
    --     version = "v1.6.5",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "lewis6991/gitsigns.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     opts = {
    --         animation = false,
    --         auto_hide = false,
    --         tabpages = false,
    --         closable = true,
    --         clickable = false,
    --         insert_at_end = true,
    --         insert_at_start = false,
    --         maximum_padding = 2,
    --         maximum_length = 30,
    --         semantic_letters = true,
    --         no_name_title = nil,
    --         letters = "asdfjklghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP12345",
    --         icons = {
    --             button = ""
    --         }
    --     },
    --     keys = {
    --         {
    --             "<leader>bp",
    --             "<cmd>BufferPick<cr>",
    --             desc = "buffer pick",
    --         },
    --         {
    --             "<leader>qH",
    --             "<cmd>BufferCloseBuffersLeft<cr>",
    --             desc = "close left buffers",
    --         },
    --         {
    --             "<leader>ql",
    --             "<cmd>BufferCloseBuffersRight<cr>",
    --             desc = "close right buffers",
    --         },
    --         {
    --             "<leader>bt",
    --             "<cmd>BufferPin<cr>",
    --             desc = "toggle buffer pin status",
    --         },
    --         {
    --             "<leader>bd",
    --             "<cmd>BufferClose<cr>",
    --             desc = "close buffer",
    --         },
    --         {
    --             "<leader>bD",
    --             "<cmd>BufferCloseAllButCurrentOrPinned<cr>",
    --             desc = "close other buffers",
    --         },
    --         {
    --             "<leader>bh",
    --             "<cmd>BufferMove<cr>",
    --             desc = "move to left",
    --         },
    --         {
    --             "<leader>bl",
    --             "<cmd>BufferMoveNext<cr>",
    --             desc = "move to right",
    --         },
    --         {
    --             "<s-h>",
    --             "<cmd>BufferPrevious<cr>",
    --             desc = "previous tab",
    --         },
    --         {
    --             "<s-l>",
    --             "<cmd>BufferNext<cr>",
    --             desc = "next tab",
    --         },
    --     }
    -- }
}
