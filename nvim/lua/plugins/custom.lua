--------------------------------------------------------------
-- LazyVIM 没有内置, 需要我自己安装的插件
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
    -- 快速启动一个 vite srever 注意需要全局安装 vite
    "liaohui5/vite-server.nvim",
    event = "VeryLazy",
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
    -- 代码对齐插件
    "Vonr/align.nvim",
    event = "VeryLazy",
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
    -- 自动切换输入法
    "keaising/im-select.nvim",
    event = "VeryLazy",
    opts = {
      default_im_select = "com.apple.keylayout.ABC", -- MacOS 默认的英文输入法
      set_previous_events = { "InsertEnter" }, -- 自动恢复上一次输入法状态事件(如:InsertEnter)
    },
  },

  {
    -- 快速打开 url
    "xiyaowong/link-visitor.nvim",
    event = "VeryLazy",
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
          desc = "LazyVim default keymaps",
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
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      {
        "<leader>Mp",
        "<cmd>MarkdownPreview<cr>",
        desc = "start preview markdown server",
      },
      {
        "<leader>MP",
        "<cmd>MarkdownPreviewStop<cr>",
        desc = "stop preview markdown server",
      },
    },
  },
  {
    -- session 管理插件
    "Shatur/neovim-session-manager",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    opts = function()
      local config = require("session_manager.config")
      local Path = require("plenary.path")
      local sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions")

      -- session autoload mode: Disabled, CurrentDir, LastSession
      local autoload_mode = config.AutoloadMode.Disabled
      return {
        sessions_dir = sessions_dir,
        autoload_mode = autoload_mode,
        path_replacer = "__",
        colon_replacer = "++",
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_only_in_session = true,
        max_path_length = 80,
        autosave_ignore_filetypes = {
          ".DS_Store",
          "gitcommit",
        },
      }
    end,

    keys = {
      {
        "<leader>pr",
        "<cmd>SessionManager load_last_session<cr>",
        desc = "load last session",
      },
      {
        "<leader>pc",
        "<cmd>SessionManager load_current_dir_session<cr>",
        desc = "load current session",
      },

      {
        "<leader>pp",
        "<cmd>SessionManager load_session<cr>",
        desc = "pick session",
      },
      {
        "<leader>pd",
        "<cmd>SessionManager delete_session<cr>",
        desc = "delete sessions",
      },
      {
        "<leader>ps",
        "<cmd>SessionManager save_current_session<cr>",
        desc = "save sessions",
      },
    },
  },
  {
    -- 合并/切分当前行(这几个都可以)
    -- https://github.com/Wansmer/treesj
    -- https://github.com/bennypowers/splitjoin.nvim
    -- https://github.com/CKolkey/ts-node-action
    "Wansmer/treesj",
    event = "VeryLazy",
    opts = {
      use_default_keymaps = false,
    },
    keys = function()
      local splitJoin = require("treesj")
      return {
        {
          "gJ",
          splitJoin.join,
          desc = "Join the object under cursor",
        },
        {
          "gS",
          splitJoin.split,
          desc = "Split the object under cursor",
        },
      }
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
  {
    -- 代码重构工具
    "ThePrimeagen/refactoring.nvim",
    event = "VeryLazy",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>rf",
        "<cmd>lua require('refactoring').select_refactor()<cr>",
        desc = "show refactoring actions",
      },
      {
        "<leader>rf",
        "<cmd>lua require('refactoring').select_refactor()<cr>",
        desc = "show refactoring actions",
        mode = "v",
      },
      {
        "<leader>il",
        "<cmd>lua require('refactoring').debug.print_var()<cr>",
        desc = "print var",
        mode = "v",
      },
      {
        "<leader>iL",
        "<cmd>lua require('refactoring').debug.cleanup()<cr>",
        desc = "clear inserted print var",
      },
    },
  },

  {
    -- 侧边栏文件树插件, 有时候 neot-tree.nvim 更新会报错
    -- 就用这个暂时替换 neo-tree.nvim, 快捷键和 neo-tree 一直
    "nvim-tree/nvim-tree.lua",
    version = "v1.*",
    event = "VeryLazy",
    enabled = false,
    opts = function(_, opts)
      -- event handler: https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree/events.lua
      -- direct to edit file after created
      local events = require("nvim-tree.events")
      events.subscribe(events.Event.FileCreated, function(file)
        vim.cmd("silent edit " .. file.fname)
      end)

      -- on attach keybindings: https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree/keymap.lua
      local on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local keybindings = {
          {
            key = "o",
            cmd = api.node.open.edit,
            desc = "open",
          },
          {
            key = "<cr>",
            cmd = api.node.open.edit,
            desc = "open",
          },
          {
            key = "<tab>",
            cmd = api.node.open.preview,
            desc = "open preview",
          },
          {
            key = "s",
            cmd = api.node.open.horizontal,
            desc = "Open: Horizontal Split",
          },
          {
            key = "<shift-s>",
            cmd = api.node.open.vertical,
            desc = "Open: Vertical Split",
          },
          {
            key = "<shift-r>",
            cmd = api.node.open.vertical,
            desc = "Open: Vertical Split",
          },
          {
            key = "R",
            cmd = api.tree.reload,
            desc = "Refresh",
          },
          {
            key = "?",
            cmd = api.tree.toggle_help,
            desc = "Show help",
          },
          {
            key = "x",
            cmd = api.fs.trash,
            desc = "Remove",
          },
          {
            key = "a",
            cmd = api.fs.create,
            desc = "Create File Or Directory",
          },
          {
            key = "r",
            cmd = api.fs.rename,
            desc = "Rename",
          },
          {
            key = "<c-r>",
            cmd = api.fs.rename_full,
            desc = "Rename: Full Path",
          },
          {
            key = "y",
            cmd = api.fs.copy.node,
            desc = "Copy",
          },
          {
            key = "<shift-y>",
            cmd = api.fs.copy.filename,
            desc = "Copy",
          },
          {
            key = "<c-y>",
            cmd = api.fs.copy.absolute_path,
            desc = "Copy path",
          },
          {
            key = "d",
            cmd = api.fs.cut,
            desc = "Cut",
          },
          {
            key = "p",
            cmd = api.fs.paste,
            desc = "Paste",
          },
          {
            key = "z",
            cmd = api.node.navigate.parent_close,
            desc = "Close Folder",
          },
        }
        for _, item in pairs(keybindings) do
          vim.keymap.set("n", item.key, item.cmd, {
            desc = item.desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          })
        end
      end
      return vim.tbl_deep_extend("force", opts, {
        on_attach = on_attach,
        disable_netrw = true,
        hijack_netrw = false,
        update_focused_file = {
          enable = true,
          update_root = true, -- auto change root directory after sesseion changed
        },
        filesystem_watchers = {
          enable = true,
        },
        actions = {
          use_system_clipboard = true,
          open_file = {
            resize_window = false,
          },
        },
        view = {
          width = vim.g.file_explorer_width,
        },
        renderer = {
          root_folder_label = false, --- hidden root director absolute path
          indent_width = 2,
          indent_markers = {
            enable = true,
          },
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = false,
              modified = false,
              git = false,
            },
          },
        },
        git = { enable = false },
        filters = {
          -- filter files to hidden
          dotfiles = false,
          git_clean = false,
          no_buffer = false,
          custom = { ".DS_Store", ".git" },
          exclude = {},
        },
      })
    end,
    keys = {
      {
        "<c-e>",
        "<cmd>NvimTreeToggle<cr>",
        desc = "Toggle file explorer",
      },
    },
  },
}
