------------------------------------------------------------------------
-- 开屏启动插件
-- https://github.com/goolord/alpha-nvim
-- https://github.com/nvimdev/dashboard-nvim
------------------------------------------------------------------------
return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = function(_, opts)
            ------------------------------------------------------------
            --- set the line-width and paddings of header and center-menus
            ------------------------------------------------------------
            local header_width = 55
            local menus_width = 42
            local header_pad_lines = 5
            local footer_pad_lines = 5

            ------------------------------------------------------------
            --- header
            ------------------------------------------------------------
            local empty_line = string.rep(" ", header_width)
            local header = {
                " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
                " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
                " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
                " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
                " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
                " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
            }
            ---@diagnostic disable-next-line: unused-local
            for i = 1, header_pad_lines do
                table.insert(header, 1, empty_line)
                table.insert(header, empty_line)
            end

            ------------------------------------------------------------
            --- menus
            ------------------------------------------------------------
            local menu_items = {
                -- menu item example:
                -- {
                --     icon = " ",
                --     icon_hl = "Title",
                --     desc = "Find File",
                --     desc_hl = "String",
                --     key = "b",
                --     keymap = "SPC f f",
                --     key_hl = "Number",
                --     action = "lua print(2)",
                -- },
                {
                    icon = "󰥔",
                    desc = "Restore last session",
                    key = "l",
                    action = "SessionManager load_last_session",
                },
                {
                    icon = "",
                    desc = "Pick session",
                    key = "p",
                    action = "SessionManager load_session",
                },
                {
                    icon = "",
                    desc = "Find files",
                    key = "f",
                    action = "Telescope find_files",
                },
                {
                    icon = "",
                    desc = "Recent files",
                    key = "r",
                    action = "Telescope oldfiles",
                },
                {
                    icon = "",
                    desc = "Configurations",
                    key = "c",
                    action = "edit $MYVIMRC",
                },
                {
                    icon = "",
                    desc = "Lazy plugins",
                    key = "P",
                    action = "Lazy",
                },
                {
                    icon = "󰏓",
                    desc = "Lazy extras",
                    key = "e",
                    action = "LazyExtras",
                },
                {
                    icon = "",
                    desc = "Dotfiles",
                    key = "H",
                    action = "lua require('link-visitor').visit('https://github.com/liaohui5/dotfiles')",
                },
                {
                    icon = "",
                    desc = "Quit",
                    key = "q",
                    action = "quitall",
                },
            }
            for _, menu in pairs(menu_items) do
                menu.icon_hl = "DashboardMenuIcon"
                menu.desc_hl = "DashboardMenuText"
                menu.key_hl = "DashboardMenuKey"
                menu.icon = menu.icon .. "  "
                menu.desc = menu.desc .. string.rep(" ", menus_width - #menu.desc)
            end

            ------------------------------------------------------------
            --- footer
            ------------------------------------------------------------
            local footer = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                local items = {
                    string.format("🚀 neovim loaded %s/%s packages in %s ms", stats.loaded, stats.count, ms),
                }
                ---@diagnostic disable-next-line: unused-local
                for i = 1, footer_pad_lines do
                    table.insert(items, 1, empty_line)
                end
                return items
            end

            ------------------------------------------------------------
            --- override highlights
            ------------------------------------------------------------
            local highlights = {
                { group = "DashboardHeader", link = "@field" },
                { group = "DashboardMenuIcon", link = "@keyword" },
                { group = "DashboardMenuText", link = "@function" },
                { group = "DashboardMenuKey", link = "@boolean" },
                { group = "DashboardFooter", link = "Comment" },
            }
            for _, hl in ipairs(highlights) do
                vim.api.nvim_set_hl(0, hl.group, {
                    link = hl.link,
                })
            end

            return vim.tbl_deep_extend("force", opts, {
                config = {
                    header = header,
                    center = menu_items,
                    footer = footer,
                },
            })
        end,
    },

    {
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
            section.buttons.val = {
                dashboard.button("l", "󰥔  " .. "Load last session", "<cmd>SessionManager load_last_session<cr>"),
                dashboard.button("p", "  " .. "Pick session", "<cmd>SessionManager load_session<cr>"),
                dashboard.button("f", "  " .. "Find files", "<cmd>Telescope find_files<cr>"),
                dashboard.button("r", "  " .. "Recent files", "<cmd>Telescope oldfiles<cr>"),
                dashboard.button("c", "  " .. "Configurations", "<cmd>edit $MYVIMRC<cr>"),
                dashboard.button("P", "  " .. "Plugins", "<cmd>Lazy<cr>"),
                dashboard.button(
                    "H",
                    "  " .. "Github",
                    "<cmd>lua require('link-visitor').visit('https://github.com/liaohui5/dotfiles')<cr>"
                ),
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
    },
}
