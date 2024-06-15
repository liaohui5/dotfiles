--------------------------------------------------------------
-- LazyVIM 没有内置(文档中没有的)的需要自己安装/配置的插件
--------------------------------------------------------------
-- stylua: ignore
local float_opts = {
    border   = "single", -- 浮动终端样式: single | double | shadow | curved
    width    = 150,      -- 全屏(width & height: 设置一个比较大的数字就会全屏显示)
    height   = 38,
    winblend = 1,
}

return {
  {
    -- 用于集成各种tui的软件(lazygit/joshuto/yazi/vifm/ranger)
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    -- stylua: ignore
    opts = {
      open_mapping      = nil,               -- 触发插件的主要按键(nil 不触发)
      hide_numbers      = true,              -- 打开的终端中是否要隐藏行号
      shade_terminals   = false,             -- 是否添加阴影
      persist_size      = false,             -- 是否保存上一次打开时的尺寸
      start_in_insert   = true,              -- 打开终端是 insert 模式
      shading_factor    = 1,                 -- 打开终端的背景颜色(1:暗色 3:亮色)
      insert_mappings   = true,              -- 插入模式是否应用快捷键
      terminal_mappings = true,              -- 在终端中是否应用快捷键
      persist_mode      = false,             -- 记住进入终端时vim的模式
      direction         = "horizontal",      -- 终端打开方式 vertical | horizontal | tab | float
      float_opts        = float_opts,        -- 悬浮雅虎是选项
      close_on_exit     = true,              -- close the terminal window when the process exits
      auto_scroll       = true,              -- automatically scroll to the bottom on terminal output
      size              = function(term)     -- 非浮动终端的大小
        if term.direction == "horizontal" then
          return 18
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.5
        end
      end,
    },
    keys = function()
      -- use toggleterm api create Terminal instance
      local function createTerminal(cmd)
        return require("toggleterm.terminal").Terminal:new({
          cmd = cmd,
          hidden = true,
          direction = "float",
          float_opts = float_opts,
        })
      end

      -- toggle terminals
      local actions = {
        -- https://github.com/jesseduffield/lazygit
        toggle_lazygit = function()
          createTerminal("lazygit"):toggle()
        end,

        -- https://github.com/extrawurst/gitui
        toggle_gitui = function()
          createTerminal("gitui"):toggle()
        end,

        -- https://github.com/kamiyaa/joshuto
        open_joshuto_cmd = function()
          local open_path = vim.fn.getcwd()
          return createTerminal(string.format("joshuto %s", open_path)):toggle()
        end,
        open_joshuto_current = function()
          local open_path = vim.fn.expand("%:p:h")
          return createTerminal(string.format("joshuto %s", open_path)):toggle()
        end,

        -- https://vifm.info/
        open_vifm = function()
          local buff_path = vim.fn.expand("%:p:h")
          local root_path = vim.fn.getcwd()
          local commands = string.format("vifm %s %s", buff_path, root_path)
          return createTerminal(commands):toggle()
        end,

        -- https://yazi-rs.github.io/
        open_yazi_cwd = function()
          local open_path = vim.fn.getcwd()
          return createTerminal(string.format("yazi %s", open_path)):toggle()
        end,
        open_yazi_current = function()
          local open_path = vim.fn.expand("%:p:h")
          return createTerminal(string.format("yazi %s", open_path)):toggle()
        end,
      }
      return {
        {
          "<C-n>",
          "<leader>oy",
          remap = true,
          noremap = true,
        },
        {
          "<C-f>",
          "<leader>oY",
          remap = true,
          noremap = true,
        },
        {
          "<leader>og",
          actions.toggle_lazygit,
          desc = "Open lazygit[toggleterm.nvim]",
        },
        {
          "<leader>oG",
          actions.toggle_gitui,
          desc = "Open gitui",
        },
        {
          "<leader>oy",
          actions.open_yazi_cwd,
          desc = "Open yazi file manager",
        },
        {
          "<leader>oY",
          actions.open_yazi_current,
          desc = "Open yazi file manager",
        },
        {
          "<leader>oj",
          actions.open_joshuto_cmd,
          desc = "Open joshuto file manager",
        },
        {
          "<leader>oJ",
          actions.open_joshuto_current,
          desc = "Open joshuto file manager",
        },
        {
          "<leader>of",
          actions.open_vifm,
          desc = "Open vifm file manager",
        },
      }
    end,
  },
  {
    -- 自动切换输入法
    "keaising/im-select.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
      default_im_select = "com.apple.keylayout.ABC", -- MacOS 默认的英文输入法
      set_previous_events = { "InsertEnter" }, -- 自动恢复上一次输入法状态事件(如:InsertEnter)
    },
  },
  {
    -- 代码对齐插件
    "Vonr/align.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/which-key.nvim",
      opts = {
        defaults = {
          ["<leader>a"] = { name = "+align" },
        },
      },
    },
    keys = {
      {
        "<leader>aa",
        "<cmd>lua require('align').align_to_string({ preview = true })<cr>",
        desc = "Align by string",
        mode = "v",
      },
      {
        "<leader>ar",
        "<cmd>lua require('align').align_to_string({ regex = true, preview = true })<cr>",
        desc = "Align by string or regexp",
        mode = "v",
      },
    },
  },
  {
    -- 快速打开 url
    "xiyaowong/link-visitor.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/which-key.nvim",
      opts = {
        defaults = {
          ["<leader>h"] = {
            name = "+help",
          },
        },
      },
    },
    opts = {
      open_cmd = nil,
      silent = true,
      skip_confirmation = true,
    },
    keys = function()
      local keybindings = {
        {
          "<leader>ou",
          "<cmd>VisitLinkNearCursor<cr>",
          desc = "Open buffer urls in browser",
        },
        {
          "<leader>oU",
          "<cmd>VisitLinkInBuffer<cr>",
          desc = "Open buffer urls in browser",
        },
      }
      local help_urls = {
        c = {
          url = "https://yianwillis.github.io/vimcdoc/doc/help.html",
          desc = "Chinese vim documentation",
        },
        n = {
          url = "https://neovim.io/doc",
          desc = "Neovim documentation",
        },
        w = {
          url = "https://github.com/folke/which-key.nvim",
          desc = "Which-key documentation",
        },
        i = {
          url = "https://github.com/neovim/neovim/issues",
          desc = "Report neovim issue",
        },
        g = {
          url = "https://vim-adventures.com/",
          desc = "Practice vim game",
        },
        k = {
          url = "https://www.lazyvim.org/keymaps",
          desc = "LazyVim keymaps documentation",
        },
      }
      for key, item in pairs(help_urls) do
        local keystr = "<leader>h" .. key
        table.insert(keybindings, {
          keystr,
          function()
            require("link-visitor").visit(item.url)
          end,
          desc = item.desc,
        })
      end
      return keybindings
    end,
  },
  -- {
  --   -- 合并/切分当前行,这几个都可以,已经在treesitter
  --   -- 中安装了ts-node-action, 所以注释掉, 不重复加载了
  --   -- https://github.com/bennypowers/splitjoin.nvim
  --   -- https://github.com/Wansmer/treesj
  --   -- https://github.com/CKolkey/ts-node-action
  -- },
}
