-----------------------------------------------------------------------
-- 代码提示/自动完成/snippets
-- github: https://github.com/hrsh7th/nvim-cmp
-- github: https://github.com/L3MON4D3/LuaSnip
-----------------------------------------------------------------------
return {
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = vim.g.snippets_save_dir,
            })
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
            local actions = {
                jump_prev = cmp.mapping(function()
                    -- 跳到代码片段上一个位置
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end),
                jump_next = cmp.mapping(function()
                    -- 跳到代码片段下一个位置
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end),
                super_tab = cmp.mapping(function(fallback)
                    -- 确定选择/展开&跳转代码片段/显示代码提示/tab
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback("<tab>", "")
                    end
                end),
                enter = cmp.mapping(function(fallback)
                    -- 确定选中
                    if cmp.visible() then
                        cmp.confirm({ select = true })
                    else
                        fallback("<cr>", "")
                    end
                end),
                open = cmp.mapping(function()
                    -- 打开代码提示框
                    cmp.complete()
                end, { "i", "c" }),
                close = cmp.mapping({
                    -- 关闭代码提示框
                    i = cmp.abort(),
                    c = cmp.close(),
                }),
                select_prev = cmp.mapping(function()
                    -- 选中上一个
                    if cmp.visible() then
                        cmp.select_prev_item()
                    end
                end, { "i", "c" }),
                select_next = cmp.mapping(function()
                    -- 选中下一个
                    if cmp.visible() then
                        cmp.select_next_item()
                    end
                end, { "i", "c" }),
            }
            return vim.tbl_deep_extend("force", opts, {
                enable = function()
                    local context = require("cmp.config.context")
                    -- 禁止在注释内容中显示提示
                    if context.in_treesitter_capture("comment") or context.in_syntax_group("Comment") then
                        return false
                    end

                    -- 禁止在输入框显示提示
                    local bufnr = vim.api.nvim_get_current_buf();
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
                    if vim.fn.reg_recording() ~= "" then
                        return false
                    end
                    if vim.fn.reg_executing() ~= "" then
                        return false
                    end
                    return true
                end,
                sources = cmp.config.sources({
                    -- sources: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "path" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lsp_document_symbol" },
                }),
                window = {
                    completion = cmp.config.window.bordered({ scrollbar = false }),
                    documentation = cmp.config.window.bordered({ scrollbar = false }),
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },

                    -- stylua: ignore
                    format = function(entry, item)
                        local strfmt      = string.format
                        local lspkind     = require("lazyvim.config").icons.kinds
                        local source_name = entry.source.name
                        local menu        = strfmt("[%s]", source_name)
                        if string.lower(source_name) == "nvim_lsp" then
                            menu = strfmt("[%s]", item.kind)
                        end
                        item.menu = menu
                        item.kind = lspkind[item.kind] or item.kind
                        return item
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<c-o>"] = actions.open,
                    ["<c-k>"] = actions.select_prev,
                    ["<c-j>"] = actions.select_next,
                    ["<c-e>"] = actions.close,
                    ["<cr>"] = actions.enter,
                    ["<c-h>"] = actions.jump_prev,
                    ["<c-l>"] = actions.jump_next,
                    ["<s-tab>"] = actions.jump_prev,
                    ["<tab>"] = actions.super_tab,
                }),
            })
        end,
    },
}
