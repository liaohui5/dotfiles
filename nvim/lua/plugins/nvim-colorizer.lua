--------------------------------------------------------------
-- 根据颜色代码直接显示颜色
-- github : https://github.com/norcalli/nvim-colorizer.lua
--------------------------------------------------------------
return {
    "norcalli/nvim-colorizer.lua",
    keys = {
        {
            "<leader>tC",
            cmd = "<mcd>ColorizerToggle<cr>",
            desc = "toggle colorizer",
            mode = "n",
        },
    },
}
