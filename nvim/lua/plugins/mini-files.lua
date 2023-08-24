-----------------------------------------------------------------------
-- 快捷方便的文件管理
-- docs: https://github.com/echasnovski/mini.files
-----------------------------------------------------------------------
return {
    "echasnovski/mini.files",
    keys = {
        {
            "<C-n>",
            "<leader>fm",
            desc = "Open mini.files",
            remap = true,
        },
        {
            "<leader><C-n>",
            "<leader>fM",
            desc = "Open mini.files",
            remap = true,
        },
    },
}
