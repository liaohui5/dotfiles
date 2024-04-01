--------------------------------------------------------------
-- UI 美化
-- https://www.lazyvim.org/plugins/ui
--------------------------------------------------------------
return {
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "goolord/alpha-nvim", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  {
    "echasnovski/mini.bufremove",
    keys = { { "<leader>bD", false } },
  },
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        options = {
          always_show_bufferline = false, -- 如果为真在启动页也会显示,会破坏启动页的样式
          offsets = {
            {
              filetype = "neo-tree", -- neo-tree | NvimTree
              highlight = "Directory",
              text = "Explorer",
              text_align = "center", -- left | center | right
            },
          },
        },
      })
    end,
    keys = {
      {
        "<leader>qH",
        "<cmd>BufferLineCloseLeft<cr>",
        desc = "close left buffers",
      },
      {
        "<leader>qL",
        "<cmd>BufferLineCloseRight<cr>",
        desc = "close right buffers",
      },
      {
        "<leader>bD",
        "<cmd>BufferLineCloseOthers<cr>",
        desc = "close other buffers",
      },
      {
        "<leader>bh",
        "<cmd>BufferLineMovePrev<cr>",
        desc = "move to left",
      },
      {
        "<leader>bl",
        "<cmd>BufferLineMoveNext<cr>",
        desc = "move to right",
      },
      {
        "<s-h>",
        "<cmd>BufferLineCyclePrev<cr>",
        desc = "previous tab",
      },
      {
        "<s-l>",
        "<cmd>BufferLineCycleNext<cr>",
        desc = "next tab",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- nvim 运行的目录
      local function project_name()
        return table.remove(vim.fn.split(vim.fn.getcwd(), "/"))
      end

      return vim.tbl_deep_extend("force", opts, {
        options = {
          globalstatus = true, -- 使用全局的状态栏(false 每个窗口显示不同的状态栏)
          component_separators = { left = "", right = "" }, -- 右侧默认: { left = "", right = "" },
          section_separators = { left = "", right = "" }, -- 左侧分割符
        },
        sections = {
          lualine_a = { { "mode", icon = "󰕷" } },
          lualine_b = { { "branch", icon = "" } },
          lualine_c = { "diff", "diagnostics", "searchcount" },
          lualine_x = { "filetype", "encoding", "fileformat", "filesize" },
          lualine_y = { { "location", icon = "󰕟" } },
          lualine_z = { { project_name, icon = "" } },
        },
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      ------------------------------------------------------------
      --- set the line-width and paddings of header and center-menus
      ------------------------------------------------------------
      local header_width = 55
      local menus_width = 42
      local header_pad_lines = 4
      local footer_pad_lines = 3

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
          icon = "",
          desc = "Current directory session",
          key = "c",
          action = "SessionManager load_current_dir_session",
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
          key = "C",
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
        ---@diagnostic disable-next-line: different-requires
        local stats = require("lazy").stats()
        local loaded, count, ms = stats.loaded, stats.count, math.floor(stats.startuptime)
        local items = {
          string.format("🚀 neovim loaded %s/%s packages in %s ms", loaded, count, ms),
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
        { group = "DashboardHeader", link = "@function" },
        { group = "DashboardMenuIcon", link = "@keyword" },
        { group = "DashboardMenuText", link = "@debug" },
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
    -- 美化折叠样式插进
    "kevinhwang91/nvim-ufo",
    enabled = false,
    event = "VeryLazy",
    version = "v1.*",
    build = "npm install --frozen-lockfile",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = (" + fold %d lines "):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, { chunkText, hlGroup })
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, { suffix, "MoreMsg" })
          return newVirtText
        end,
      })
    end,
  },
}
