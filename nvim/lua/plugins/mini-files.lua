-----------------------------------------------------------------------
-- 快捷方便的文件管理
-- docs: https://github.com/echasnovski/mini.files
-----------------------------------------------------------------------
return {
    "echasnovski/mini.files",
    opts = {
        mappings = {
            close = "<c-q>",
        },
    },
    keys = {
        {
            "<c-f>",
            "<leader>fm",
            desc = "Open mini.files",
            remap = true,
            noremap = true,
        },
    },
}
