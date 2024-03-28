-----------------------------------------------------------------------
-- 代码提示/自动完成/snippets等编辑功能增强相关插件
-- https://www.lazyvim.org/plugins/coding
-----------------------------------------------------------------------
return {
  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.surround", enabled = false },
  { "echasnovski/mini.comment", enabled = false },
  { "echasnovski/mini.ai", enabled = false },
  { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
  {
    "echasnovski/mini.pairs",
    enabled = true,
    version = "*",
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    enabled = true,
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        -- disabled default keybindings
        -- stylua: ignore
        keymaps = {
          insert          = false,
          insert_line     = false,
          normal          = false,
          normal_cur      = false,
          normal_line     = false,
          normal_cur_line = false,
          visual          = false,
          visual_line     = false,
          delete          = false,
          change          = false,
          change_line     = false,
        },
      })
    end,
    keys = {
      -- mode: actions that plugins can perform
      -- i: <Plug>(nvim-surround-insert)
      -- i: <Plug>(nvim-surround-insert-line)
      -- v: <Plug>(nvim-surround-visual)
      -- v: <Plug>(nvim-surround-visual-line)
      -- n: <Plug>(nvim-surround-delete)
      -- n: <Plug>(nvim-surround-change)
      -- n: <Plug>(nvim-surround-normal)
      -- n: <Plug>(nvim-surround-normal-cur)
      -- n: <Plug>(nvim-surround-normal-line)
      -- n: <Plug>(nvim-surround-normal-cur-line)
      {
        "gss",
        "<Plug>(nvim-surround-visual)",
        desc = "add surround character",
        mode = "v",
      },
      {
        "gsl",
        "<Plug>(nvim-surround-visual-line)",
        desc = "add surround character",
        mode = "v",
      },
      {
        "gss",
        "<Plug>(nvim-surround-normal)",
        desc = "add surround character with range",
      },
      {
        "gsl",
        "<Plug>(nvim-surround-normal-cur-line)",
        desc = "add current line surround character",
      },
      {
        "gsL",
        "<Plug>(nvim-surround-normal-line)",
        desc = "add lines surround character with range",
      },
      {
        "gsd",
        "<Plug>(nvim-surround-delete)",
        desc = "remove surround character",
      },
      {
        "gsu",
        "<Plug>(nvim-surround-change)",
        desc = "update surround character",
      },
    },
  },
  {
    -- comment
    "numToStr/Comment.nvim",
    event = "BufEnter",
    opts = function(_, opts)
      return vim.tbl_extend("force", opts, {
        padding = true,
        sticky = true,
        mappings = { -- 禁止使用默认的快捷键
          basic = false,
          extra = false,
        },
      })
    end,
    keys = {
      {
        "<c-\\>",
        "<Plug>(comment_toggle_linewise_visual)<c-c>gv-gv",
        desc = "toggle comment in selection",
        mode = "v",
      },
      {
        "<c-\\>",
        "<Plug>(comment_toggle_linewise_current)",
        desc = "toggle comment",
        mode = "n",
      },
    },
  },
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
