-----------------------------------------------------------------------
-- 快捷方便的文件管理
-- docs: https://github.com/echasnovski/mini.files
-----------------------------------------------------------------------
return {
    "echasnovski/mini.files",
    opts = function(_, opts)
        return vim.tbl_extend("force", opts, {
            mappings = {
                close = "<c-q>",
            },
        })
    end,
    keys = {
        {
            "<c-f>",
            "<leader>fm",
            desc = "Open mini.files",
            remap = true,
        },
        {
            "<leader><c-f>",
            "<leader>fM",
            desc = "Open mini.files",
            remap = true,
        },
    },
}
