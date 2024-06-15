-----------------------------------------------------------------------
-- 代码提示/自动完成/snippets等编辑功能增强相关插件
-- https://www.lazyvim.org/plugins/coding
-----------------------------------------------------------------------
return {
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      {
        "garymjr/nvim-snippets",
        opts = {
          friendly_snippets = true,
          global_snippets = { "all", "global" },
        },
        dependencies = { "rafamadriz/friendly-snippets" },
      },
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.snippet = {
        expand = function(item)
          return LazyVim.cmp.expand(item.body)
        end,
      }
      return vim.tbl_deep_extend("force", opts, {
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-5),
          ["<C-f>"] = cmp.mapping.scroll_docs(5),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = LazyVim.cmp.confirm(),
          ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        sources = cmp.config.sources({
          { name = "snippets" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "nvim_lsp_document_symbol" },
          { name = "nvim_lsp_signature_help" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, item)
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
          end,
        },
      })
    end,

    keys = {
      {
        "<Tab>",
        function()
          return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<S-Tab>",
        function()
          return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<Tab>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<c-l>",
        "<Tab>",
        remap = true,
        noremap = true,
        mode = { "i", "s" },
      },
      {
        "<c-h>",
        "<S-Tab>",
        remap = true,
        noremap = true,
        mode = { "i", "s" },
      },
    },
  },
}
