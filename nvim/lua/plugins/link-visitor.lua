--------------------------------------------------------------
-- 快速打开 url
-- github: https://github.com/xiyaowong/link-visitor.nvim
--------------------------------------------------------------

return {
    -- 快速打开 url
    "xiyaowong/link-visitor.nvim",
    event = "VeryLazy",
    opts = {
        open_cmd = nil,
        silent = true,
        skip_confirmation = true,
    },
    keys = function()
        local keybindings = {
            {
                "<leader>oU",
                "<cmd>VisitLinkNearCursor<cr>",
                desc = "Open buffer urls in browser",
            },
            {
                "<leader>ou",
                "<cmd>VisitLinkInBuffer<cr>",
                desc = "Open buffer urls in browser",
            },

        }

        local help_urls = {
            c = {
                url = "https://yianwillis.github.io/vimcdoc/doc/help.html",
                desc = "chinese vim documentation",
            },
            n = {
                url = "https://neovim.io/doc",
                desc = "neovim documentation",
            },
            w = {
                url = "https://github.com/folke/which-key.nvim",
                desc = "which-key documentation",
            },
            i = {
                url = "https://github.com/neovim/neovim/issues",
                desc = "report neovim issue",
            },
            g = {
                url = "https://vim-adventures.com/",
                desc = "practice vim game",
            },
            k = {
                url = "https://www.lazyvim.org/keymaps",
                desc = "LazyVim default keymaps"
            },
        }
        for key, item in pairs(help_urls) do
            local keystr = "<leader>h" .. key;
            table.insert(keybindings, {
                keystr,
                function()
                    require("link-visitor").visit(item.url)
                end,
                desc = item.desc,
            })
        end
        return keybindings
    end,
}
