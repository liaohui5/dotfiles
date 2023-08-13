-----------------------------------------------------------------------
-- 添加/删除/修改两边字符, 功能如这个 tpope/vim-surround 插件
-- docs: https://github.com/kylechui/nvim-surround
-----------------------------------------------------------------------
return {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {
        keymaps = {
            normal = "dc",
            visual = "gs",
            delete = "dr",
            change = "du",
        }
    }
}
