------------------------------------------------------------
-- Customizing LSP keymaps
-- https://www.lazyvim.org/plugins/lsp
------------------------------------------------------------
return {
    "neovim/nvim-lspconfig",
    init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        table.insert(keys, {
            "<leader>ff",
            function()
                require("lazyvim.plugins.lsp.format").format({ force = true })
            end,
            desc = "Format Dcoument",
            mode = { "n", "v" },
            noremap = true,
            silent = true,
        })
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
            volar = { -- better vue syntax supported
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
            },
            emmet_ls = {
                filetypes = {
                    "html",
                    "typescriptreact",
                    "javascriptreact",
                    "css",
                    "sass",
                    "scss",
                    "less",
                    "markdown",
                    "vue",
                },
                init_options = { -- better html/css snippets supported
                    html = {
                        options = {
                            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L26
                            ["bem.enabled"] = true,
                        },
                    },
                },
            },

            bashls = {
                filetypes = {
                    "sh",
                    "bash",
                },
            },
        },
    },
}
