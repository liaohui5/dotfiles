--------------------------------------------------------------
-- 代码重构工具
-- github: https://github.com/ThePrimeagen/refactoring.nvim
--------------------------------------------------------------
return {
    enabled = false,
    "ThePrimeagen/refactoring.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        {
            "<leader>rf",
            "<cmd>lua require('refactoring').select_refactor()<cr>",
            desc = "show refactoring actions",
        },
        {
            "<leader>rf",
            "<cmd>lua require('refactoring').select_refactor()<cr>",
            desc = "show refactoring actions",
            mode = "v",
        },
        {
            "<leader>il",
            "<cmd>lua require('refactoring').debug.print_var()<cr>",
            desc = "print var",
            mode = "v",
        },
        {
            "<leader>iL",
            "<cmd>lua require('refactoring').debug.cleanup()<cr>",
            desc = "clear inserted print var",
        },
    },
}
