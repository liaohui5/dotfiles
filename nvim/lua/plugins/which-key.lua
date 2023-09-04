--------------------------------------------------------------
-- 快捷键管理
-- github: https://github.com/folke/which-key.nvim
--------------------------------------------------------------
-- stylua: ignore
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        ignore_missing = false, -- 忽略没有 whichKey.register 的快捷键映射
        show_help = true,       -- 显示帮助信息
        triggers = "auto",      -- 哪些按键可以触发 which-key 显示,如果手动设置可能导致一些功能失效
        defaults = {
            mode = { "n", "v" },
            ["g"] = { name = "+goto" },
            ["z"] = { name = "+fold" },
            ["]"] = { name = "+next" },
            ["["] = { name = "+prev" },
            ["<leader>a"] = { name = "+align/auto" },
            ["<leader>b"] = { name = "+buffer" },
            ["<leader>c"] = { name = "+code/comment" },
            ["<leader>d"] = { name = "+debug" },
            ["<leader>e"] = { name = "+error" },
            ["<leader>f"] = { name = "+file/find" },
            ["<leader>g"] = { name = "+git" },
            ["<leader>h"] = { name = "+help" },
            ["<leader>i"] = { name = "+insert" },
            ["<leader>j"] = { name = "+jump" },
            -- ["<leader>k"] = { name = "+keymaps" },
            ["<leader>l"] = { name = "+list" },
            ["<leader>M"] = { name = "+markdown" },
            ["<leader>o"] = { name = "+open" },
            ["<leader>p"] = { name = "+project" },
            ["<leader>q"] = { name = "+quit" },
            ["<leader>r"] = { name = "+replace" },
            ["<leader>s"] = { name = "+search/section" },
            ["<leader>t"] = { name = "+test" },
            ["<leader>u"] = { name = "+ui" },
            ["<leader>w"] = { name = "+window" },
            ["<leader>x"] = { name = "+diagnostics/quickfix" },
        },
        plugins = {
            -- 禁止单词拼写插件
            spelling = {
                enabled = false,
            },
        },
        icons = {
            -- 图标
            breadcrumb = "↣",
            separator = "➤",
            group = "+",
        },
        window = {
            -- 窗口样式
            border = "single", -- none | single | double | shadow
            winblend = 0,
        },
        layout = {
            -- 布局
            spacing = 4,
            align = "center", -- left | center | right
        },
        disable = {
            -- 禁止菜单的 filetype 或 buftype
            buftypes = {},
            filetypes = { "TelescopePrompt", "NvimTree" },
        },
    },
}
