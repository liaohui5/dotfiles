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
}
