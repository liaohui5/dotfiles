--------------------------------------------------------------------------------------
-- Customizing LSP keymaps
-- https://www.lazyvim.org/plugins/lsp
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--------------------------------------------------------------------------------------
return {
    "neovim/nvim-lspconfig",
    init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        table.insert(keys, {
            "<leader>rn",
            "<leader>cr",
            desc = "Rename Symbol",
            mode = { "n", "v" },
            remap = true,
            silent = true,
        })
        table.insert(keys, {
            "gh",
            "gK",
            desc = "lsp hover",
            mode = { "n", "v" },
            remap = true,
            silent = true,
        })
    end,
    opts = {
        servers = {
            emmet_language_server = {
                -- better html/css support
                filetypes = {
                    "html",
                    "css",
                    "less",
                    "sass",
                    "scss",
                    "pug",
                    "vue",
                    "javascript",
                    "javascriptreact",
                    "typescriptreact",
                },
            },

            volar = {
                -- better vue support
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
            },

            bashls = {
                -- better shell script support
                filetypes = {
                    "sh",
                    "bash",
                },
            },
        },
    },
}
