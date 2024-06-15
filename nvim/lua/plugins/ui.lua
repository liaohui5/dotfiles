--------------------------------------------------------------
-- UI 美化
-- https://www.lazyvim.org/plugins/ui
--------------------------------------------------------------
return {
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        options = {
          always_show_bufferline = false,
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
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        options = {
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { { "mode", icon = "󰕷" } },
          lualine_b = { { "branch", icon = "" } },
          lualine_c = { "filename", "diff", "diagnostics", "searchcount" },
          lualine_x = { "filetype", "filesize" },
          lualine_y = { "location" },
          lualine_z = { "fileformat", "encoding" },
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
      local header_pad_lines = 5
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
      local menu_items = {
        {
          icon = "󰾅",
          desc = "Show startuptime",
          key = "S",
          action = "StartupTime",
        },
        {
          icon = "",
          desc = "Restore last session",
          key = "l",
          action = "SessionManager load_last_session",
        },
        {
          icon = "",
          desc = "Pick sessions",
          key = "p",
          action = "SessionManager load_session",
        },
        {
          icon = "",
          desc = "Search files",
          key = "s",
          action = "Telescope find_files",
        },
        {
          icon = "󰕁",
          desc = "Recent files",
          key = "f",
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
          icon = "",
          desc = "Quit neovim",
          key = "q",
          action = "quit",
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
}
