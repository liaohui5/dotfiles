--------------------------------------------------------------
-- 代码重构工具
-- docs: https://github.com/ThePrimeagen/refactoring.nvim
--------------------------------------------------------------
return {
    "ThePrimeagen/refactoring.nvim",
    event = "BufEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        -- stylua: ignore
        prompt_func_return_type = {
            go   = true,
            java = true,
            cpp  = true,
            c    = true,
            h    = true,
            hpp  = true,
            cxx  = true,
            js   = true,
            ts   = true,
        },
        -- stylua: ignore
        prompt_func_param_type = {
            go   = true,
            java = true,
            cpp  = true,
            c    = true,
            h    = true,
            hpp  = true,
            cxx  = true,
            js   = true,
            ts   = true,
        },
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
