------------------------------------------------------------------------
-- 开屏启动插件
-- alpha-nvim: https://github.com/goolord/alpha-nvim
-- dashboard-nvim: https://github.com/glepnir/dashboard-nvim
------------------------------------------------------------------------
return {
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",

        -- stylua: ignore
        opts = function(_, opts)
            --- set the line-width and paddings of header and center-menus
            local header_width     = 55
            local menus_width      = header_width - 20
            local header_pad_lines = 6
            local menus_pad_lines  = 5

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
                    desc = "Load last session",
                    key = "l",
                    keymap = "SPC p r",
                    action = "SessionManager load_last_session",
                },
                {
                    icon = "",
                    desc = "Pick session",
                    key = "p",
                    keymap = "SPC p p",
                    action = "SessionManager load_session",
                },
                {
                    icon = "",
                    desc = "Find files",
                    key = "f",
                    keymap = "<c-p>",
                    action = "Telescope find_files",
                },
                {
                    icon = "",
                    desc = "Recent files",
                    key = "r",
                    keymap = "SPC s F",
                    action = "Telescope oldfiles",
                },
                {
                    icon = "",
                    desc = "Configuration",
                    key = "c",
                    keymap = "SPC o c",
                    action = "edit $MYVIMRC",
                },
                {
                    icon = "",
                    desc = "Plugins",
                    key = "P",
                    keymap = "SPC P p",
                    action = "Lazy",
                },
                {
                    icon = "",
                    desc = "Plugins",
                    key = "H",
                    keymap = "SPC h G",
                    action = "lua require('link-visitor').visit('https://github.com/liaohui5/dotfiles')",
                },
                {
                    icon = "",
                    desc = "Quit",
                    key = "q",
                    keymap = "<c-q>",
                    action = "quitall",
                },
            }
            for _, menu in pairs(menu_items) do
                menu.icon_hl = "Title"
                menu.desc_hl = "String"
                menu.key_hl = "Number"
                menu.icon = menu.icon .. "  "
                menu.desc = menu.desc .. string.rep(" ", menus_width - #menu.desc)
            end

            ------------------------------------------------------------
            --- footer
            ------------------------------------------------------------
            local footerGenerator = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                local footer = {
                    string.format("🚀 neovim loaded %s/%s packages in %s ms", stats.loaded, stats.count, ms),
                }
                ---@diagnostic disable-next-line: unused-local
                for i = 1, menus_pad_lines do
                    table.insert(footer, 1, empty_line)
                end
                return footer
            end

            return vim.tbl_deep_extend("force", opts, {
                config = {
                    header = header,
                    center = menu_items,
                    footer = footerGenerator,
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
    },
}
