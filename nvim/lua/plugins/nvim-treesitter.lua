--------------------------------------------------------------
-- 更好的语法支持
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/HiPhish/rainbow-delimiters.nvim
--------------------------------------------------------------
return {
    {
        "nvim-treesitter/nvim-treesitter",
        keys = {
            { "+", desc = "Increment selection", mode = "v" },
            { "_", desc = "Decrement selection", mode = "v" },
        },
        opts = function(_, opts)
            -- 支持语法高亮的语言: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
            local ensure_installed = {
                "css",
                "bash",
                "scss",
                "lua",
                "yaml",
                "pug",
                "html",
                "javascript",
                "json",
                "markdown",
                "markdown_inline",
                "dockerfile",
                "sql",
                "tsx",
                "typescript",
                "toml",
                "vim",
                "vimdoc",
                "vue",
                "rust",
                "git_config",
                "gitignore",
            }
            return vim.tbl_deep_extend("force", opts, {
                ensure_installed = ensure_installed,
                sync_install = true,
                auto_install = true,
                highlight = {
                    -- 允许 treesitter 来高亮代码内容
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    -- 允许 treesitter 来识别缩进
                    enable = true,
                },
                incremental_selection = {
                    -- 允许使用 treesitter 来选择内容
                    enable = true,
                    keymaps = {
                        node_incremental = "+", -- 扩大选区
                        node_decremental = "_", -- 减少选区
                    },
                },
                autotag = {
                    -- xml标签自动闭合
                    enable = true,
                    enable_rename = true,
                    enable_close = true,
                    enable_close_on_slash = true,
                },
            })
        end,
    },
    {
        -- 自动不同颜色高亮不同层级的括号
        "HiPhish/rainbow-delimiters.nvim",
        event = "BufReadPost",
        enabled = false,
    },
    {
        -- 自动闭合 HTML 和 jsx 标签
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        enabled = false,
    },
    {
        -- 显示当前上下文
        "nvim-treesitter/nvim-treesitter-context",
        enabled = false,
    },
    {
        -- 快速执行一些操作
        "ckolkey/ts-node-action",
        opts = {},
        dependencies = { "nvim-treesitter" },
        keys = {
            {
                "ga",
                "<cmd>NodeAction<cr>",
                desc = "Trigger Node Action",
            },
        },
    },
}
