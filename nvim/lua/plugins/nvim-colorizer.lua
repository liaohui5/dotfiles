--------------------------------------------------------------
-- 根据颜色代码直接显示颜色
-- github : https://github.com/norcalli/nvim-colorizer.lua
--------------------------------------------------------------
return {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    keys = {
        {
            "<leader>tC",
            cmd = "<mcd>ColorizerToggle<cr>",
            desc = "toggle colorizer",
            mode = "n",
        },
    },
    -- stylua: ignore
    config = function()
        local colorizer = require("colorizer")
        colorizer.setup({
            mode   = "background",  -- You can change the mode to "foreground" to colorize foreground color codes
            RGB    = true,          -- Enable RGB color notation support(e.g #fff)
            RRGGBB = true,          -- Enable RRGGBB color notation support(e.g #f8f8f8)
            names  = false,         -- Disable color name highlighting (e.g. "red", "green", "blue")
            css    = true,          -- Enable CSS color notation support(e.g. rgb(255,0,0), rgba(255,1,1,0.5) )
        })
        vim.defer_fn(function()
            colorizer.attach_to_buffer(0)
        end, 0)
    end,
}
