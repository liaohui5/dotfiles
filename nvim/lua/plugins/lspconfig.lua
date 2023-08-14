------------------------------------------------------------
-- Customizing LSP keymaps
-- https://www.lazyvim.org/plugins/lsp
------------------------------------------------------------
return {
    "neovim/nvim-lspconfig",
    init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        local lens = #keys + 1
        keys[lens] = {
            "<leader>ff",
            "<leader>cf",
            desc = "Format Dcoument",
            remap = true,
            mode = { "n", "v" },
        }
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
        },
    },
}
