-----------------------------------------------------------------------
-- 快捷方便的文件管理
-- docs: https://github.com/echasnovski/mini.files
-----------------------------------------------------------------------
return {
    "echasnovski/mini.files",
    opts = function(_, opts)
        return vim.tbl_extend("force", opts, {
            mappings = {
                close = "<C-q>",
            },
        })
    end,
    keys = {
        {
            "<C-e>",
            "<leader>fM",
            desc = "Open mini.files",
            remap = true,
        },
        {
            "<leader><C-e>",
            "<leader>fm",
            desc = "Open mini.files",
            remap = true,
        },
    },
}
