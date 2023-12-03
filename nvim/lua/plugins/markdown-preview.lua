--------------------------------------------------------------
-- 在浏览器中预览 markdown
-- github : https://github.com/iamcco/markdown-preview.nvim
--------------------------------------------------------------
return {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
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
