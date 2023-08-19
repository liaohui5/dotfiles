--------------------------------------------------------------
-- lsp 功能美化增强
-- github: https://github.com/glepnir/lspsaga.nvim
--------------------------------------------------------------
return {
    "glepnir/lspsaga.nvim",
    enabled = true,
    event = "LspAttach",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
    },
    opts = function(_, opts)
        local keys = {
            scroll_preview = {
                scroll_down = "<c-u>",
                scroll_up = "<c-d>",
            },
            finder = {
                jump_to = "o",
                edit = { "e", "<cr>" },
                vsplit = "s",
                split = "i",
                tabe = "t",
                quit = { "q", "<c-c>", "<ESC>" },
            },
            definition = {
                edit = "<c-c>o",
                vsplit = "<c-c>v",
                split = "<c-c>i",
                tabe = "<c-c>t",
                close = "<Esc>",
                quit = "<ESC>",
            },
            diagnostic = {
                exec_action = "o",
                go_action = "g",
                quit = "<ESC>",
            },
            code_action = {
                quit = "<ESC>",
                exec = "<cr>",
            },
            outline = {
                jump = "o",
                expand_collapse = "u",
                quit = "<ESC>",
            },
            rename = {
                quit = "<c-c>",
                exec = "<cr>",
                mark = "x",
                confirm = "<cr>",
            },
        }
        return vim.tbl_deep_extend("force", opts, {
            request_timeout = 1000,
            scroll_preview = keys.scroll_preview,
            finder = keys.finder,
            definition = keys.definition,
            preview = {
                -- 预览窗口
                lines_above = 0,
                lines_below = 10,
            },
            code_action = {
                -- 代码建议
                num_shortcut = true,
                keys = keys.code_action,
            },
            diagnostic = {
                -- 代码诊断
                on_insert = true,
                show_virt_line = true,
                show_code_action = true,
                show_source = true,
                jump_num_shortcut = true,
                max_width = 0.6, -- 0.1 ~ 1
                border_follow = true,
                keys = keys.diagnostic,
            },
            lightbulb = {
                -- 代码建议(小灯泡)
                enable = false,
                enable_in_insert = true,
                sign = false,
                sign_priority = 40,
                virtual_text = true,
            },
            rename = {
                -- 重命名变量(包括引用)
                in_select = true,
                confirm = keys.rename.confirm,
                quit = keys.rename.quit,
                exec = keys.rename.exec,
                mark = keys.rename.mark,
            },
            outline = {
                -- 变量/函数/类列表
                -- 类似: https://github.com/simrat39/symbols-outline.nvim
                win_position = "right",
                win_with = "",
                win_width = 35,
                show_detail = false,
                auto_preview = false,
                auto_refresh = true,
                auto_close = true,
                custom_sort = nil,
                keys = keys.outline,
            },
            symbol_in_winbar = {
                -- 顶部栏路径显示
                -- 类似: https://github.com/SmiteshP/nvim-navic
                enable = false,
                separator = "  ",
                hide_keyword = true,
            },
            ui = {
                theme = "round", -- 目前只支持这一个主题
                border = "single", -- 可选值: single,double,rounded,solid,shadow.
                title = true,
                winblend = 0,
                expand = "",
                collapse = "",
                preview = " ",
                code_action = "󰌵",
                diagnostic = "",
                incoming = "󰏷 ",
                outgoing = "󰏻 ",
                hover = " ",
            },
        })
    end,
    keys = {
        { -- 查看帮助文档
            "gh",
            "<cmd>Lspsaga hover_doc<cr>",
            desc = "Lspsaga hover",
        },
        { -- 查看当前代码诊断信息
            "ge",
            "<cmd>Lspsaga show_line_diagnostics<cr>",
            desc = "Lspsaga show diagnostics",
        },
        { -- 跳到函数定义位置
            "gR",
            "<cmd>Lspsaga finder<cr>",
            desc = "Lspsaga finder",
        },
        { -- 预览代码(也可以直接修改)
            "gp",
            "<cmd>Lspsaga peek_definition<cr>",
            desc = "Lspsaga peek definition",
        },
        { -- 打开 outline
            "<leader>js",
            "<cmd>Lspsaga outline<cr>",
            desc = "jump symbol in buffer",
        },
        { -- 打开 outline
            "<leader>ls",
            "<cmd>Lspsaga outline<cr>",
            desc = "list symbols",
        },
        { -- 重命名变量
            "<leader>rn",
            "<cmd>Lspsaga rename<cr>",
            desc = "rename symbol",
        },
        { -- 函数调用
            "<leader>li",
            "<cmd>Lspsaga incoming_calls<cr>",
            desc = "List incoming calls"
        },
        { -- 函数调用
            "<leader>lo",
            "<cmd>Lspsaga outgoing_calls<cr>",
            desc = "List outgoing calls"
        },
        -- { -- 下一个错误
        --     "<leader>ej",
        --     "<cmd>Lspsaga diagnostic_jump_next<cr>",
        --     desc = "next error",
        -- },
        -- { -- 上一个错误
        --     "<leader>ek",
        --     "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        --     desc = "next error",
        -- },
        -- { -- 快速修复
        --     "<leader>ca",
        --     "<cmd>Lspsaga code_action<cr>",
        --     desc = "code action quickFix",
        -- },
        -- { -- 打开 outline
        --     "<leader>ss",
        --     "<cmd>Lspsaga outline<cr>",
        --     desc = "search outline in buffer",
        -- },
    },
}
