------------------------------------------------------------------------
-- 开屏启动插件
-- github: https://github.com/goolord/alpha-nvim
------------------------------------------------------------------------
return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local section = dashboard.section
        local header = {
            "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        }
        section.header.val = header
        section.footer.val = ""
        -- stylua: ignore
        section.buttons.val = {
            dashboard.button("l", "󰥔  " .. "Load last session", "<cmd>SessionManager load_last_session<cr>"),
            dashboard.button("p", "  " .. "Pick session", "<cmd>SessionManager load_session<cr>"),
            dashboard.button("f", "  " .. "Find files", "<cmd>Telescope find_files<cr>"),
            dashboard.button("r", "  " .. "Recent files", "<cmd>Telescope oldfiles<cr>"),
            dashboard.button("c", "  " .. "Configurations", "<cmd>edit $MYVIMRC<cr>"),
            dashboard.button("P", "  " .. "Plugins", "<cmd>Lazy<cr>"),
            dashboard.button("H", "  " .. "Github", "<cmd>lua require('link-visitor').visit('https://github.com/liaohui5/dotfiles')<cr>"),
            dashboard.button("q", "  " .. "Quit", "<cmd>quitall<cr>"),
        }
        for _, button in ipairs(section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        section.header.opts.hl = "AlphaHeader"
        section.buttons.opts.hl = "AlphaButtons"
        section.footer.opts.hl = "AlphaFooter"
        dashboard.opts.layout = {
            { type = "padding", val = 6 },
            section.header,
            { type = "padding", val = 6 },
            section.buttons,
            { type = "padding", val = 5 },
            section.footer,
        }
        return dashboard
    end,
    config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                callback = function()
                    ---@diagnostic disable-next-line: different-requires
                    require("lazy").show()
                end,
            })
        end

        -- setup alpha
        require("alpha").setup(dashboard.opts)
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local states = require("lazy").stats()
                local timems = math.floor(states.startuptime)
                local footer = string.format(" 🚀 neovim loaded %s packages in %s ms", states.count, timems)
                dashboard.section.footer.val = footer
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        -- override highlights
        vim.api.nvim_set_hl(0, "AlphaHeader", {
            link = "@field",
        })
        vim.api.nvim_set_hl(0, "AlphaShortcut", {
            link = "@function",
        })
        vim.api.nvim_set_hl(0, "AlphaButtons", {
            link = "@boolean",
        })
        vim.api.nvim_set_hl(0, "AlphaFooter", {
            link = "Comment",
        })
    end,
}
