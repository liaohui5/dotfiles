------------------------------------------------------------
-- 自动高亮匹配光标下的单词
-- github: https://github.com/RRethy/vim-illuminate
------------------------------------------------------------

return {
    "RRethy/vim-illuminate",
    enabled = false,
    opts = function(_, opts)
        -- https://neovim.io/doc/user/api.html#nvim_set_hl()
        local hl = vim.api.nvim_set_hl
        local highlights = {
            bg = "NONE",
            bold = true,
            underline = true,
        }
        hl(0, "IlluminatedWordText", highlights)
        hl(0, "IlluminatedWordRead", highlights)
        hl(0, "IlluminatedWordWrite", highlights)
        return vim.tbl_deep_extend("force", opts, {
            providers = {
                "treesitter",
            },
        })
    end,
}
