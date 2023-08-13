--------------------------------------------------------------
-- 更好的语法支持
-- docs: https://github.com/nvim-treesitter/nvim-treesitter
--------------------------------------------------------------
return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        "windwp/nvim-ts-autotag",
    },
    opts = function(_, opts)
        local keys = {
            node_incremental = "+", -- 扩大选区
            node_decremental = "_", -- 减少选区
        }
        return vim.tbl_deep_extend("force", opts, {
            sync_install = true,
            auto_install = true,
            ensure_installed = {
                -- 支持语法高亮的语言: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
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
                "dot",
                "dockerfile",
                "sql",
                "tsx",
                "typescript",
                "toml",
                "vim",
                "vimdoc",
                "vue",
                "rust",
            },
            -- incremental_selection = {
            --     -- 允许使用 treesitter 来选择内容
            --     enable = true,
            --     keymaps = keys.incremental_selection,
            -- },
            highlight = {
                -- 允许 treesitter 来高亮代码内容
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                -- 允许 treesitter 来识别缩进
                enable = false,
            },
            context_commentstring = {
                -- 识别语法注释: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
                enable = true,
                enable_autocmd = false,
            },
            autotag = {
                -- xml标签自动闭合: https://github.com/windwp/nvim-ts-autotag
                enable = true,
            },
        });
    end
}
