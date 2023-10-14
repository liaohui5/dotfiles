--------------------------------------------------------------
-- 粘贴历史
-- github: https://github.com/gbprod/yanky.nvim
--------------------------------------------------------------
return {
    "gbprod/yanky.nvim",
    opts = {
        highlight = { timer = 250 },
        ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
    },
    keys = {
      -- stylua: ignore
        { "<leader>y", function() require("telescope").extensions.yank_history.yank_history({ }) end, desc = "Open Yank History" },
    },
}
