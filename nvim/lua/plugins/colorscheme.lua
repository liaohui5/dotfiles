-----------------------------------------------------
-- 主题插件
-- https://www.lazyvim.org/plugins/colorscheme
-----------------------------------------------------
return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "base16-monokai" },
  },
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = true,
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        style = "moon", -- allow values: night, storm, moon
        on_highlights = function(hl, c)
          -- update telescope prompt background color
          hl.TelescopeNormal.bg = c.bg
          hl.TelescopeBorder.bg = c.bg

          -- hidden neo-tree window separate line
          hl.NeoTreeWinSeparator = {
            bg = c.bg,
            fg = c.bg,
          }

          -- remove keyworld font italic style
          hl.Keyword.style.italic = false
          hl["@keyword"].style.italic = false

          -- remove comment font italic style
          hl.Comment.style.italic = false
        end,
      })
    end,
  },
  {
    "RRethy/nvim-base16",
    enabled = true,
    lazy = true,
    config = function()
      local api = vim.api
      local base16 = require("base16-colorscheme")
      base16.with_config({
        telescope = true,
        indentblankline = true,
        cmp = true,
        illuminate = true,
        dapui = false,
        notify = false,
        ts_rainbow = false,
      })
      base16.setup({
        -- monokai: https://github.com/RRethy/nvim-base16/blob/master/lua/colors/monokai.lua
        base00 = "#272822",
        base01 = "#383830",
        base02 = "#49483e",
        base03 = "#656866",
        base04 = "#a59f85",
        base05 = "#f8f8f2",
        base06 = "#f5f4f1",
        base07 = "#f9f8f5",
        base08 = "#f92672",
        base09 = "#fd971f",
        base0A = "#f4bf75",
        base0B = "#a6e22e",
        base0C = "#a1efe4",
        base0D = "#66d9ef",
        base0E = "#ae81ff",
        base0F = "#cc6633",
      })
      local colors = base16.colors
      colors.black = "#151612"
      local hl_overrides = {
        Visual = {
          bg = colors.base03,
        },
        VertSplit = {
          link = "TSComment",
        },
        NeoTreeNormal = {
          fg = colors.base05,
          bg = colors.black,
        },
        NeoTreeNormalNC = {
          fg = colors.base05,
          bg = colors.base01,
        },
        NeoTreeWinSeparator = {
          bg = colors.base00,
          fg = colors.base00,
        },
        TelescopePromptTitle = {
          bg = colors.base01,
          fg = colors.base08,
        },
        TelescopePreviewTitle = {
          fg = colors.base0B,
        },
        TelescopePromptPrefix = {
          bg = "NONE",
          fg = colors.base0E,
        },
        TSFuncBuiltin = {
          italic = false,
        },
        TSComment = {
          link = "Comment",
          italic = false,
        },
        TSTypeBuiltin = {
          italic = false,
        },
        PmenuSel = { -- nvim-cmp selected item
          bg = colors.black,
          fg = colors.base0C,
        },
        IlluminatedWordText = {
          bg = "NONE",
          bold = true,
          underline = true,
        },
        IlluminatedWordRead = {
          link = "IlluminatedWordText",
        },
        IlluminatedWordWrite = {
          link = "IlluminatedWordText",
        },
      }
      api.nvim_create_autocmd("ColorScheme", {
        group = api.nvim_create_augroup("user_override_highligts", {
          clear = true,
        }),
        callback = function()
          for key, val in pairs(hl_overrides) do
            api.nvim_set_hl(0, key, val)
          end
        end,
      })
    end,
  },
}
