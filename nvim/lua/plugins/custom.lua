--------------------------------------------------------------
-- LazyVIM 没有内置(文档中没有的)的需要自己安装/配置的插件
--------------------------------------------------------------
-- stylua: ignore
local float_opts = {
    border   = "single", -- 浮动终端样式: single | double | shadow | curved
    width    = 160,      -- 全屏(width & height: 设置一个比较大的数字就会全屏显示)
    height   = 40,
    winblend = 1,
}

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    -- stylua: ignore
    opts = {
      open_mapping      = "<c-x>",           -- 触发插件的主要按键
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
        -- lazygit: https://github.com/jesseduffield/lazygit
        toggle_lazygit = function()
          createTerminal("lazygit"):toggle()
        end,

        -- gitui: https://github.com/extrawurst/gitui
        toggle_gitui = function()
          createTerminal("gitui"):toggle()
        end,

        -- joshuto: https://github.com/kamiyaa/joshuto
        toggle_joshuto_cwd = function()
          local open_path = vim.fn.getcwd()
          return createTerminal(string.format("joshuto %s", open_path)):toggle()
        end,
        toggle_joshuto_current = function()
          local open_path = vim.fn.expand("%:p:h")
          return createTerminal(string.format("joshuto %s", open_path)):toggle()
        end,

        -- vifm: https://vifm.info/
        toggle_vifm = function()
          local buff_path = vim.fn.expand("%:p:h")
          local root_path = vim.fn.getcwd()
          local commands = string.format("vifm %s %s", buff_path, root_path)
          return createTerminal(commands):toggle()
        end,

        -- yazi: https://yazi-rs.github.io/
        toggle_yazi_cwd = function()
          local open_path = vim.fn.getcwd()
          return createTerminal(string.format("yazi %s", open_path)):toggle()
        end,
        toggle_yazi_current = function()
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
          desc = "toggle lazygit[toggleterm.nvim]",
        },
        {
          "<leader>oG",
          actions.toggle_gitui,
          desc = "toggle gitui",
        },
        {
          "<leader>oy",
          actions.toggle_yazi_cwd,
          desc = "toggle yazi file manager",
        },
        {
          "<leader>oY",
          actions.toggle_yazi_current,
          desc = "toggle yazi file manager",
        },
        {
          "<leader>oj",
          actions.toggle_joshuto_cwd,
          desc = "toggle joshuto file manager",
        },
        {
          "<leader>oJ",
          actions.toggle_joshuto_current,
          desc = "toggle joshuto file manager",
        },
        {
          "<leader>of",
          actions.toggle_vifm,
          desc = "toggle vifm file manager",
        },
        {
          "<leader><c-x>",
          "<cmd>ToggleTermToggleAll<cr>",
          desc = "Toggle all terminals",
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
    -- 快速启动一个 vite srever 注意需要全局安装 vite
    "liaohui5/vite-server.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        -- add vite-server.nvim status to lualine
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
          local function vite_server_status()
            local ok, vs = pcall(require, "vite-server")
            local status = ""
            if ok then
              status = "󰡄"
            end

            if vs.is_started then
              status = string.format("%s %s", status, vs.gen_url(vs.config.vite_cli_opts))
            end

            return status
          end
          table.insert(opts.sections.lualine_x, 1, vite_server_status)
        end,
      },
      {
        -- add vite-server.nvim keys to which menu
        "folke/which-key.nvim",
        opts = function(_, opts)
          return vim.tbl_deep_extend("force", opts, {
            defaults = {
              ["<leader>v"] = { name = "+vite" },
            },
          })
        end,
      },
    },
    opts = {
      show_cmd = false,
      vite_cli_opts = {
        port = 8888,
      },
    },
    keys = {
      {
        "<leader>vq",
        "<cmd>lua require('vite-server').stop()<cr>",
        desc = "stop vite server",
      },
      {
        "<leader>vs",
        "<cmd>lua require('vite-server').start(vim.fn.getcwd())<cr>",
        desc = "start vite server project root directory",
      },
      {
        "<leader>vS",
        "<cmd>lua require('vite-server').start()<cr>",
        desc = "start server current directory",
      },
    },
    config = function()
      local vs = require("vite-server")
      local ok = pcall(require, "session_manager.config")
      if not ok then
        return
      end
      -- if neovim_session_manager.nvim is installed
      -- after session changed stop the vite server
      local autocmd, augroup = vim.api.nvim_create_autocmd, vim.api.nvim_create_augroup
      autocmd({ "User" }, {
        pattern = "SessionLoadPost",
        group = augroup("stop_vite_server", { clear = true }),
        callback = function()
          if vs.is_started then
            vs.stop()
          end
        end,
      })
    end,
  },

  {
    -- 代码对齐插件
    "Vonr/align.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/which-key.nvim",
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts, {
          defaults = {
            ["<leader>a"] = { name = "+align" },
          },
        })
      end,
    },
    keys = {
      {
        "<leader>aa",
        "<cmd>lua require('align').align_to_string(false,true,false)<cr>",
        desc = "align by string",
        mode = "v",
      },
      {
        "<leader>aA",
        "<cmd>lua require('align').align_to_char(1,true,false)<cr>",
        desc = "align by char",
        mode = "v",
      },
      {
        "<leader>ap",
        "<cmd>lua require('align').align_to_string(false,true,true)<cr>",
        desc = "align by string(preview)",
        mode = "v",
      },
      {
        "<leader>ar",
        "<cmd>lua require('align').align_to_string(true,true,true)<cr>",
        desc = "align by string or pattern(preview)",
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
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts, {
          defaults = {
            ["<leader>h"] = {
              name = "+help",
            },
          },
        })
      end,
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
          desc = "chinese vim documentation",
        },
        n = {
          url = "https://neovim.io/doc",
          desc = "neovim documentation",
        },
        w = {
          url = "https://github.com/folke/which-key.nvim",
          desc = "which-key documentation",
        },
        i = {
          url = "https://github.com/neovim/neovim/issues",
          desc = "report neovim issue",
        },
        g = {
          url = "https://vim-adventures.com/",
          desc = "practice vim game",
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
  --   -- session 管理插件
  --   "Shatur/neovim-session-manager",
  --   enabled = true,
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --
  --   opts = function()
  --     local config = require("session_manager.config")
  --     local Path = require("plenary.path")
  --     local sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions")
  --
  --     -- session autoload mode: Disabled, CurrentDir, LastSession
  --     local autoload_mode = config.AutoloadMode.Disabled
  --     return {
  --       sessions_dir = sessions_dir,
  --       autoload_mode = autoload_mode,
  --       path_replacer = "__",
  --       colon_replacer = "++",
  --       autosave_last_session = true,
  --       autosave_ignore_not_normal = true,
  --       autosave_only_in_session = true,
  --       max_path_length = 80,
  --       autosave_ignore_filetypes = {
  --         ".DS_Store",
  --         "gitcommit",
  --       },
  --     }
  --   end,
  --
  --   keys = {
  --     {
  --       "<leader>pr",
  --       "<cmd>SessionManager load_last_session<cr>",
  --       desc = "load last session",
  --     },
  --     {
  --       "<leader>pc",
  --       "<cmd>SessionManager load_current_dir_session<cr>",
  --       desc = "load current session",
  --     },
  --
  --     {
  --       "<leader>pp",
  --       "<cmd>SessionManager load_session<cr>",
  --       desc = "pick session",
  --     },
  --     {
  --       "<leader>pd",
  --       "<cmd>SessionManager delete_session<cr>",
  --       desc = "delete sessions",
  --     },
  --     {
  --       "<leader>ps",
  --       "<cmd>SessionManager save_current_session<cr>",
  --       desc = "save sessions",
  --     },
  --   },
  -- },
  -- {
  --   -- 合并/切分当前行,这几个都可以,已经在treesitter
  --   -- 中安装了ts-node-action, 所以注释掉, 不重复加载了
  --   -- https://github.com/bennypowers/splitjoin.nvim
  --   -- https://github.com/Wansmer/treesj
  --   -- https://github.com/CKolkey/ts-node-action
  -- },
}
