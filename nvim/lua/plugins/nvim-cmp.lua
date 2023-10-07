-----------------------------------------------------------------------
-- 代码提示/自动完成/snippets
-- github: https://github.com/hrsh7th/nvim-cmp
-- github: https://github.com/L3MON4D3/LuaSnip
-- AI 代码提示助手
-- https://github.com/Exafunction/codeium.nvim
-----------------------------------------------------------------------
return {
    {
        "L3MON4D3/LuaSnip",
        keys = {
            -- cancel luasnip tab mapping, use nvim-cmp tab mapping
            { "<tab>", false, mode = "i" },
            { "<tab>", false, mode = "s" },
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = vim.g.snippets_save_dir,
            })
        end,
    },
    {
        -- ai code helper
        "Exafunction/codeium.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            if vim.g.enable_codeium then
                local config_path = vim.fn.stdpath("config") .. "/.codeium-api-key"
                require("codeium").setup({
                    config_path = config_path,
                })
            end
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-nvim-lua",
        },
        opts = function(_, opts)
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            -----------------------------------
            -- keybindings
            -----------------------------------
            local keybindings = {
                -- 打开代码提示框
                ["<C-o>"] = cmp.mapping(function()
                    cmp.complete()
                end, { "i", "c" }),

                -- 选中上一个
                ["<C-k>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item()
                    end
                end, { "i", "c" }),

                -- 选中下一个
                ["<C-j>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item()
                    end
                end, { "i", "c" }),

                -- 关闭代码提示框
                ["<C-e>"] = cmp.mapping({
                    i = cmp.abort(),
                    c = cmp.close(),
                }),

                -- 确定选中
                ["<CR>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = true })
                    else
                        fallback("<cr>", "")
                    end
                end),

                -- 跳到代码片段上一个位置
                ["<C-h>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),

                -- 跳到代码片段下一个位置
                ["<C-l>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    end
                end, { "i", "s" }),

                -- 选择下一个
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback("<tab>", "")
                    end
                end),
            }

            return vim.tbl_deep_extend("force", opts, {
                mapping = cmp.mapping.preset.insert(keybindings),
                sources = cmp.config.sources({
                    -- sources: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
                    { name = "codeium" },
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "path" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lsp_document_symbol" },
                }),
                window = {
                    -- use bordered window style
                    -- completion = cmp.config.window.bordered({ scrollbar = false }),
                    -- documentation = cmp.config.window.bordered({ scrollbar = false }),
                    completion = {
                        border = { "", "", "", "", "", "", "", "" },
                        scrollbar = false,
                    },
                    documentation = {
                        border = { "", "", "", " ", "", "", "", " " },
                        scrollbar = false,
                    },
                },
                enabled = function()
                    -- 设置必须是开启状态
                    if not vim.g.enable_auto_completation then
                        return false
                    end

                    local context = require("cmp.config.context")
                    -- 禁止在注释内容中显示提示
                    if context.in_treesitter_capture("comment") or context.in_syntax_group("Comment") then
                        return false
                    end

                    -- 禁止在输入框显示提示
                    local bufnr = vim.api.nvim_get_current_buf()
                    local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
                    if buftype == "prompt" or buftype == "nofile" then
                        return false
                    end

                    -- 禁止在一些可以输入的 buffer 显示提示
                    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
                    if filetype == "minifiles" or filetype == "spectre_panel" then
                        return false
                    end

                    -- 不能在录制模式 & 回放录制模式显示提示
                    if vim.fn.reg_recording() ~= "" or vim.fn.reg_executing() ~= "" then
                        return false
                    end
                    return true
                end,
                formatting = {
                    fields = { "kind", "abbr", "menu" },

                    -- stylua: ignore
                    format = function(entry, item)
                        local strfmt      = string.format
                        local lspkind     = require("lazyvim.config").icons.kinds
                        local source_name = string.lower(entry.source.name)
                        local menu        = strfmt("[%s]", source_name)

                        if source_name == "nvim_lsp" then
                          -- lsp
                            menu = strfmt("[lsp %s]", item.kind)
                        elseif source_name == "codeium" then
                          -- codeium
                          item.kind = "Event"
                        end
                        item.menu = menu
                        item.kind = lspkind[item.kind] or item.kind
                        return item
                    end,
                },
            })
        end,
    },
}
