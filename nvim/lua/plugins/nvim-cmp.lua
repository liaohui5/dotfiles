-----------------------------------------------------------------------
-- 代码提示/自动完成/snippets
-- github: https://github.com/hrsh7th/nvim-cmp
-- github: https://github.com/L3MON4D3/LuaSnip
-----------------------------------------------------------------------
return {
    {
        "L3MON4D3/LuaSnip",
        keys = function()
            -- delete luasnip tab mapping, use nvim-cmp tab mapping
            return {}
        end,
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = vim.g.snippets_save_dir,
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
            -- defaults:
            -- "hrsh7th/cmp-nvim-lsp",
            -- "hrsh7th/cmp-buffer",
            -- "hrsh7th/cmp-path",
            -- "saadparwaiz1/cmp_luasnip",

            -- customs:
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-nvim-lua",
        },
        opts = function(_, opts)
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            ----------------------------------------------------------------------
            -- cmdline
            ----------------------------------------------------------------------
            ---@diagnostic disable-next-line: missing-fields
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline({
                    -- stylua: ignore
                    ["<C-o>"] = cmp.mapping(function() cmp.complete() end, { "i", "c" }),
                }),
                sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
            })

            ----------------------------------------------------------------------
            -- sources: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
            ----------------------------------------------------------------------
            local sources = cmp.config.sources(vim.list_extend(opts.sources, {
                { name = "nvim_lua" },
                { name = "nvim_lsp_signature_help" },
                { name = "nvim_lsp_document_symbol" },
            }))

            ----------------------------------------------------------------------
            -- enabled or disabled
            ----------------------------------------------------------------------
            local function enabled()
                -- disabled when vim.g.enable_auto_completation value is false
                if not vim.g.enable_auto_completation then
                    return false
                end

                -- disabled in comments
                local context = require("cmp.config.context")
                if context.in_treesitter_capture("comment") or context.in_syntax_group("Comment") then
                    return false
                end

                -- disabled in input or prompt window
                local bufnr = vim.api.nvim_get_current_buf()
                local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
                if buftype == "prompt" or buftype == "nofile" then
                    return false
                end

                -- disabled in some buffers
                local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
                if filetype == "minifiles" or filetype == "spectre_panel" then
                    return false
                end

                -- disabled in macro recording mode(q)
                if vim.fn.reg_recording() ~= "" or vim.fn.reg_executing() ~= "" then
                    return false
                end
                return true
            end

            ----------------------------------------------------------------------
            -- format auto complete menu styles
            ----------------------------------------------------------------------
            local format = function(entry, item)
                local lspkinds = require("lazyvim.config").icons.kinds
                local source_format_map = {
                    nvim_lsp = function()
                        item.menu = string.format("[lsp %s]", item.kind)
                    end,
                    codeium = function()
                        item.kind = "Event"
                        item.menu = "[codeium]"
                    end,
                    cmp_tabnine = function()
                        item.kind = "Event"
                        item.menu = "[tabnine]"
                    end,
                }

                local handler = source_format_map[string.lower(entry.source.name)]
                if type(handler) == "function" then
                    handler()
                end
                item.kind = lspkinds[item.kind] or item.kind
                return item
            end

            ----------------------------------------------------------------------
            -- keybindings
            ----------------------------------------------------------------------
            local keybindings = {
                -- open auto complete menu
                ["<C-o>"] = cmp.mapping(function()
                    cmp.complete()
                end, { "i", "c" }),

                -- select previous item
                ["<C-k>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item()
                    end
                end, { "i", "c" }),

                -- select next item
                ["<C-j>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item()
                    end
                end, { "i", "c" }),

                -- close auto complete menu
                ["<C-e>"] = cmp.mapping({
                    i = cmp.abort(),
                    c = cmp.close(),
                }),

                -- confirm selected item
                ["<CR>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = true })
                    else
                        fallback()
                    end
                end),

                -- confirm selected item and replace
                ["<S-CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),

                -- close auto menu and input enter
                ["<C-CR>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,

                -- jump snippet previous position if jumpable
                ["<C-h>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),

                -- jump snippet next position if jumpable
                ["<C-l>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    end
                end, { "i", "s" }),

                -- select next item or input tab
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end),
            }

            return vim.tbl_deep_extend("force", opts, {
                mapping = cmp.mapping.preset.insert(keybindings),
                enabled = enabled,
                sources = sources,
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = format,
                },
                window = {
                    -- some styles about auto complete window
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
            })
        end,
    },
}
