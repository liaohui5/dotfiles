-----------------------------------------------------
-- 编辑器功能增强
-- https://www.lazyvim.org/plugins/editor
-----------------------------------------------------
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    enabled = true,
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
      {
        "<c-e>",
        "<cmd>Neotree toggle<cr>",
        desc = "Toggle file explorer",
      },
    },
    opts = function(_, opts)
      ------------------------------------------
      -- event handlers
      ------------------------------------------
      local events = require("neo-tree.events")
      local event_handlers = {
        {
          -- 创建文件后立即编辑
          event = events.FILE_ADDED,
          handler = function(filepath)
            if vim.fn.filereadable(filepath) == 1 then
              vim.cmd("silent edit " .. filepath)
            end
          end,
        },
        {
          -- 文件删除后立即关闭对应的 buffer 标签页
          event = events.FILE_DELETED,
          handler = function(filepath)
            local ok, bufremove = pcall(require, "mini.bufremove")
            if not ok then
              return
            end
            local buflist = vim.api.nvim_list_bufs()
            local target_stats = vim.loop.fs_stat(filepath)
            local target_is_file = target_stats and target_stats.type == "file"
            for _, bufnr in ipairs(buflist) do
              -- 如果删除的目标是文件就关闭文件对应的标签页然后停止循环
              local bufpath = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ":p")
              if target_is_file and filepath == bufpath then
                bufremove.delete(bufnr, true)
                break
              end

              -- 如果删除的目标是目录就关闭目录下所有的标签页
              if string.sub(bufpath, 1, string.len(filepath)) == filepath then
                bufremove.delete(bufnr, true)
              end
            end
          end,
        },
      }

      ------------------------------------------
      -- commands
      ------------------------------------------
      local commands = {
        remove2trash = {
          nowait = true,
          command = function(state)
            local node = state.tree:get_node()
            local strfmt = string.format
            local inputs = require("neo-tree.ui.inputs")
            local confirm_msg = strfmt("Are you sure to remove %s ?", node.name)
            inputs.confirm(confirm_msg, function(confirmed)
              if not confirmed then
                return
              end
              -- 移动到垃圾桶 & 通知事件处理器关闭 node.path 对应的 buffer
              -- 需要先安装 trash 命令: brew install trash
              -- 推荐使用 trash 命令, 因为 trash 会自动重命名(如果垃圾桶有同名文件)
              -- 如果使用 mv 命令, -f 只能强制覆盖, 否则会 mv 失败
              -- vim.cmd(strfmt("silent !mv -f %s ~/.Trash", node.path))
              vim.cmd(strfmt("silent !trash %s", node.path))
              events.fire_event(events.FILE_DELETED, node.path)
            end)
          end,
        },
        copy_filename = {
          nowait = true,
          command = function(state)
            local node = state.tree:get_node()
            vim.fn.setreg("+", node.name)
          end,
        },
        copy_filepath = {
          nowait = true,
          command = function(state)
            local node = state.tree:get_node()
            vim.fn.setreg("+", node:get_id())
          end,
        },
      }

      local natural_sort = function(a, b)
        -- 排序规则如下:
        -- 1. 如果是文件名是数字开头那么就排在字母开头的文件名前面
        -- 2. 如果文件名都是数字那么就按照数字的从小到大排序
        -- 3. 如果文件名都是字母开头那么就按照字母的先后顺序排序
        -- 被排序元素 a, b 的结构如下:
        -- {
        --   base = "README",
        --   ext = "md",
        --   id = "/Users/xxx/codes/dotfiels/README.md",
        --   parent_path = "/Users/xxx/codes/dotfiels",
        --   path = "/Users/xxx/codes/dotfiels/README.md",
        --   type = "file"
        -- }

        -- 如果是目录和文件比较那么目录在前,文件在后
        if a.type ~= b.type then
          return a.type < b.type
        end

        -- 如果还没有加载完成(先随意排序,别让后面报错)
        if type(a.name) ~= "string" or type(b.name) ~= "string" then
          return a.path < b.path
        end

        -- 字符串是否是数字开头
        local function starts_with_number(str)
          return string.match(str, "^%d") ~= nil
        end

        -- 如果a以数字开头而b不是, 则返回true, 将a排在b前面
        if starts_with_number(a.name) and not starts_with_number(b.name) then
          return true
        end

        -- 如果b以数字开头而a不是, 则返回false, 将b排在a前面
        if not starts_with_number(a.name) and starts_with_number(b.name) then
          return false
        end

        -- 如果a和b都是数字, 则按照数字大小排序
        local a_num = tonumber(string.match(a.name, "^%d+"))
        local b_num = tonumber(string.match(b.name, "^%d+"))

        -- 如果a和b都是数字, 则按照数字大小排序
        if a_num and b_num then
          return a_num < b_num
        end

        -- 如果a和b都不是数字, 则按照字母顺序排序
        return a.name < b.name
      end

      return vim.tbl_deep_extend("force", opts, {
        enable_git_status = false,
        enable_diagnostics = false,
        close_if_last_window = true,
        popup_border_style = "single",
        hide_root_node = true,
        use_default_mappings = false,
        event_handlers = event_handlers,
        sort_function = natural_sort,
        sources = { "filesystem" },
        source_selector = {
          winbar = false,
        },
        default_component_configs = {
          indent = {
            with_expanders = false, --- hide arrow icon
            indent_size = 2,
            padding = 1,
            with_markers = true,
          },
        },
        window = {
          position = "left",
          mappings = {
            ["o"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "cancel",
            ["<tab>"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["s"] = "open_vsplit",
            ["S"] = "open_split",
            ["z"] = "close_node",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
          },
        },
        filesystem = {
          bind_to_cwd = true,
          follow_current_file = {
            enabled = true,
          },
          use_libuv_file_watcher = true,
          filtered_items = {
            visible = true,
            hide_gitignored = true,
            hide_hidden = true,
            hide_dotfiles = false,
            hide_by_name = { ".DS_Store" },
            never_show = { ".DS_Store" },
          },
          window = {
            mappings = {
              ["a"] = {
                "add",
                config = {
                  show_path = "absolute", -- none | relative | absolute
                },
              },
              ["r"] = "rename",
              ["y"] = "copy_to_clipboard",
              ["d"] = "cut_to_clipboard",
              ["p"] = "paste_from_clipboard",
              -- ["x"] = "delete", -- force delete from disk
              ["x"] = commands.remove2trash,
              ["Y"] = commands.copy_filename,
              ["<C-y>"] = commands.copy_filepath,
              ["oc"] = { "order_by_created", nowait = false },
            },
            fuzzy_finder_mappings = {},
          },
        },
      })
    end,
  },
  {
    -- 侧边栏文件树插件, 有时候 neot-tree.nvim 更新后会报错
    -- 就用这个暂时替换 neo-tree.nvim, 快捷键和 neo-tree 一致
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

  {
    "nvim-pack/nvim-spectre",
    opts = {
        -- stylua: ignore start
        color_devicons     = true,
        live_update        = true,
        open_cmd           = "noswapfile vnew", -- 'vnew' | 'split new',
        replace_vim_cmd    = "cdo",
        is_open_target_win = true,
        is_insert_mode     = false, -- 打开替换窗口默认模式
        line_sep_start     = "╭───────────────────────────────────────────────────────────",
        result_padding     = "│ ➜ ",
        line_sep           = "╰───────────────────────────────────────────────────────────",
    },
    keys = {
      { "<leader>sr", false },
      -- {
      --     -- 由于这个命令有问题: 搜索不出来结果, 所以改用 search-replace.nvim
      --     "<leader>rr",
      --     "<cmd>Spectre %<cr>",
      --     desc = "Replace in current file(Spectre)",
      -- },
      {
        "<leader>rR",
        "<cmd>Spectre<cr>",
        desc = "Replace in all files",
        remap = true,
      },
    },
  },
  {
    "roobert/search-replace.nvim",
    event = "VeryLazy",
    opts = {
      default_replace_single_buffer_options = "gcI",
      default_replace_multi_buffer_options = "egcI",
    },
    keys = {
      {
        "<leader>rr",
        "<cmd>SearchReplaceSingleBufferOpen<cr>",
        desc = "Replace in current buffer",
      },
      {
        "<leader>rr",
        "<cmd>SearchReplaceWithinVisualSelection<cr>",
        desc = "Replace in current buffer",
        mode = "v",
      },
    },
  },
  {
    "folke/flash.nvim",
    opts = {
      rainbow = { enabled = true },
      highlight = { matches = true },
    },
    keys = {
      {
        "<leader>ll",
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^",
          })
        end,
        mode = "n",
        desc = "jump to line",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
        -- stylua: ignore
        return vim.tbl_deep_extend("force", opts, {
            ignore_missing = false, -- 忽略没有 whichKey.register 的快捷键映射
            show_help = true,       -- 显示帮助信息
            triggers = "auto",
            defaults = {
                mode = { "n", "v" },
                ["g"] = { name = "+goto" },
                ["z"] = { name = "+fold" },
                ["]"] = { name = "+next" },
                ["["] = { name = "+prev" },
                ["<leader>a"] = { name = "+align/auto" },
                ["<leader>b"] = { name = "+buffer" },
                ["<leader>c"] = { name = "+code/comment" },
                ["<leader>d"] = { name = "+debug" },
                ["<leader>e"] = { name = "+error" },
                ["<leader>f"] = { name = "+file/find" },
                ["<leader>g"] = { name = "+git" },
                ["<leader>h"] = { name = "+help" },
                ["<leader>i"] = { name = "+insert" },
                ["<leader>j"] = { name = "+jump" },
                -- ["<leader>k"] = { name = "+keymaps" },
                ["<leader>l"] = { name = "+list" },
                ["<leader>M"] = { name = "+markdown" },
                ["<leader>o"] = { name = "+open" },
                ["<leader>p"] = { name = "+project" },
                ["<leader>q"] = { name = "+quit" },
                ["<leader>r"] = { name = "+replace" },
                ["<leader>s"] = { name = "+search/section" },
                ["<leader>t"] = { name = "+test" },
                ["<leader>u"] = { name = "+ui" },
                ["<leader>w"] = { name = "+window" },
                ["<leader>x"] = { name = "+diagnostics/quickfix" },
            },
            plugins = { -- 禁止单词拼写插件
                spelling = { enabled = false },
            },
            layout = { -- 菜单布局样式
                spacing = 4,
                align = "center", -- left | center | right
            },
            disable = { -- 禁止菜单的 filetype 或 buftype
                buftypes = {},
                filetypes = { "TelescopePrompt", "NvimTree" },
            },
        })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      yadm = { enable = false },
    },
    keys = {
      {
        "<leader>gf",
        "<cmd>Gitsigns refresh<cr>",
        desc = "refresh gitsigns",
      },
      {
        "<leader>gu",
        "<cmd>Gitsigns undo_stage_hunk<cr>",
        desc = "undo current hunk",
      },
      {
        "<leader>gr",
        "<cmd>Gitsigns reset_hunk<cr>",
        desc = "reset current hunk",
      },
      {
        "<leader>gR",
        "<cmd>Gitsigns reset_buffer<cr>",
        desc = "reset buffer all hunk",
      },
      {
        "<leader>gs",
        "<cmd>Gitsigns stage_hunk<cr>",
        desc = "stage current hunk",
      },
      {
        "<leader>gS",
        "<cmd>Gitsigns stage_buffer<cr>",
        desc = "stage buffer all hunk",
      },
      {
        "<leader>gd",
        "<cmd>Gitsigns diffthis<cr>",
        desc = "diff hunks",
      },
      {
        "<leader>gj",
        "<cmd>Gitsigns next_hunk<cr>",
        desc = "next hunk",
      },
      {
        "<leader>gk",
        "<cmd>Gitsigns prev_hunk<cr>",
        desc = "previous hunk",
      },
    },
  },
  {
    "RRethy/vim-illuminate",
    opts = function(_, opts)
      -- https://neovim.io/doc/user/api.html#nvim_set_hl()
      local hl = vim.api.nvim_set_hl
      local highlights = {
        bg = "NONE",
        bold = true,
        underline = true,
      }
      hl(0, "IlluminatedWordText", highlights)
      hl(0, "IlluminatedWordRead", highlights)
      hl(0, "IlluminatedWordWrite", highlights)
      return vim.tbl_deep_extend("force", opts, {
        providers = {
          "treesitter",
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      return vim.tbl_deep_extend("force", opts, {
        defaults = {
          mappings = {
            i = { -- 插入模式快捷键
              ["<c-j>"] = actions.move_selection_next,
              ["<c-k>"] = actions.move_selection_previous,
              ["<c-n>"] = actions.cycle_history_next,
              ["<c-p>"] = actions.cycle_history_prev,
            },
          },
          selection_caret = " ", -- 选择指示图标
          prompt_prefix = "🔭 ", -- 输入框前缀
          prompt_title = false, -- 输入框标题
          border = true, -- 边框
          layout_strategy = "horizontal", -- 布局
          sorting_strategy = "ascending", -- 布局方式
          layout_config = {
            prompt_position = "top", -- 输入框位置
          },
          file_ignore_patterns = { -- 忽略目录
            "**node_modules",
            "**.git",
          },
        },
        pickers = {
          find_files = {
            prompt_title = false,
            previewer = false,
            -- stylua: ignore
            find_command = {
              "fd",     -- 需要安装命令: https://github.com/chinanf-boy/fd-zh
              "-H",     -- -H: show hidden files
              "-I",     -- -I: dont ignore `.gitignore` rules
              "--type",
              "file",   -- type file & symlink 仅显示文件和软连接,不显示目录
              "--type", -- 更多选项: https://github.com/chinanf-boy/fd-zh
              "symlink",
              "--strip-cwd-prefix",
            },
          },
        },
      })
    end,
    keys = {
      { "<leader>ff", false },
      {
        "<C-p>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find Files (root dir)",
        noremap = true,
      },
      {
        "<leader>bb",
        "<leader>,",
        desc = "Switch Buffers",
        remap = true,
        noremap = true,
      },
    },
  },
}
