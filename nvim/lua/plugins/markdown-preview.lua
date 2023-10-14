--------------------------------------------------------------
-- 在浏览器中预览 markdown
-- github : https://github.com/iamcco/markdown-preview.nvim
--------------------------------------------------------------
return {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    ft = { "markdown" },
    build = function()
        -- WARN: 解决如下报错: https://github.com/iamcco/markdown-preview.nvim/issues/278
        -- node:internal/modules/cjs/loader:1080
        -- Error: Cannot find module 'tslib'
        vim.fn["mkdp#util#install"]()
    end,
    keys = {
        {
            "<leader>Mp",
            "<cmd>MarkdownPreview<cr>",
            desc = "start preview markdown server",
        },
        {
            "<leader>MP",
            "<cmd>MarkdownPreviewStop<cr>",
            desc = "stop preview markdown server",
        },
    },
}
