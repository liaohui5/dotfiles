----------------------------------------------------------------
-- #    # ###### #   #       #    # ###### #    # #    #  ####
-- #   #  #       # #        ##  ## #      ##   # #    # #
-- ####   #####    #   ##### # ## # #####  # #  # #    #  ####
-- #  #   #        #         #    # #      #  # # #    #      #
-- #   #  #        #         #    # #      #   ## #    # #    #
-- #    # ######   #         #    # ###### #    #  ####   ####
----------------------------------------------------------------
--------------------------------------
-- Normal 菜单
--------------------------------------
local create_noremal_menus = function(wk)
  wk.register({
    ["<C-\\>"] = { nil, "toggle comment[kommentary]" },
    ["<C-b>"] = { nil, "Back" },
    ["<C-d>"] = { nil, "scroll down" },

    -- splitjoin
    ["gJ"] = { nil, "join line[splitjoin]" },
    ["gS"] = { nil, "split line[splitjoin]" },

    -- fold
    ["z"] = { name = "+Fold" },

    -- arguments
    ["<leader>A"] = {
      name = "+Arguments",
      p = { nil, "swap arguments previous[textobjects]" };
      n = { nil, "swap arguments next[textobjects]" };
    },

    -- buffers
    ["<leader>b"]  = {
      name = "+Buffer",
    },
    ["<leader>b1"] = {
      "<cmd>bfirst<CR>",
      "first Buffer"
    },
    ["<leader>b0"] = {
      "<cmd>blast<CR>",
      "last Buffer"
    },
    ["<leader>bb"] = {
      "<cmd>buffers<CR>",
      "show all buffers"
    },
    ["<leader>bs"] = {
      "<cmd>buffers<CR>",
      "search buffers"
    },
    ["<leader>bd"] = {
      "<cmd>bprevious|bdelete #<CR>",
      "close current buffer"
    },
    ["<leader>bl"] = {
      "<cmd>vsplit<CR>",
      "move buffer to right"
    },
    ["<leader>bj"] = {
      "<cmd>vsplit<CR>",
      "move buffer to bottom"
    },
    ["<leader>bn"] = {
      "<cmd>bnext<CR>", -- H
      "next buffer"
    },
    ["<leader>bp"] = {
      "<cmd>bprevious<CR>", -- L
      "previous buffer"
    },
    ["<leader>bD"] = {
      "<cmd>%bd|e#|bd#<cr>|'\"<CR>",
      "close other buffers"
    },
    ["<leader>bY"] = {
      '<cmd>%y "<CR>',
      "copy buffer to clipboard"
    },
    ["<leader>bP"] = {
      function()
        vim.cmd [[
        :%delete _
        :put+
      ]]
      end,
      "paste clipboard to buffer"
    },

    -- comments/code_action
    ["<leader>c"] = {
      name = "+Comment/CodeAction",
    },

    -- debugger
    ["<leader>d"] = {
      name = "+Debugger",
    },

    -- errors
    ["<leader>e"] = {
      name = "+Error",
    },

    -- find/file
    ["<leader>f"] = {
      name = "+File/Find",
      R = {
        "<cmd>RnvimrToggle<CR>",
        "open with ranger(C-n)[rnvimr]"
      },
      o = {
        "<cmd>!open .<CR>",
        "open file with system explorer"
      },
      L = {
        "<cmd>!open .<CR>",
        "open file with system explorer"
      },
      s = {
        "<cmd>write<CR>",
        "save current buffer"
      }
    },

    -- git
    ["<leader>g"] = {
      name = "+Git",
      i = {
        "<cmd>!git init .<CR>",
        "git init",
      },
    },

    -- helps
    ["<leader>h"] = {
      name = "+Help",
      d = {
        "<cmd>call SilentOpenURL('https://neovim.io/doc')<CR>",
        "open neovim documentation"
      },
      D = {
        "<cmd>call SilentOpenURL('https://github.com/folke/which-key.nvim')<CR>",
        "open which-key documentation"
      },
      i = {
        "<cmd>call SilentOpenURL('https://github.com/neovim/neovim/issues')<CR>",
        "report neovim issue"
      },
    },

    -- insert
    ["<leader>i"] = {
      name = "+Insert",
      i = {
        nil,
        "Insert Image URL"
      },
      l = {
        nil,
        "insert console.log",
      }
    },

    -- jump/join/split
    ["<leader>j"] = {
      name = "+Jump",
      ["t"] = {
        name = "+TODO",
      }
    },

    -- List
    ["<leader>l"] = {
      name = "+List",
      -- l = {
      --   "<cmd>buffers<CR>",
      --   "show all buffers",
      -- },
    },

    -- NPM
    ["<leader>n"] = {
      name = "+npm/pnpm/yarn"
    },

    -- open
    ["<leader>o"] = {
      name = "+Open",
      v = {
        name = "+VIM-links",
        ["0"] = {
          "<cmd>call SilentOpenURL('https://vim-adventures.com')<CR>",
          "open vim game",
        },
        ["1"] = {
          "<cmd>call SilentOpenURL('https://vim.rtorr.com')<CR>",
          "open vim tips"
        },
        ["2"] = {
          "<cmd>call SilentOpenURL('https://github.com/chloneda/vim-cheatsheet')<CR>",
          "open vim cheatsheet"
        },
        ["3"] = {
          "<cmd>call SilentOpenURL('https://www.w3cschool.cn/vim/4xnd1hsw.html')<CR>",
          "open w3cschool study vimscript"
        },
        ["4"] = {
          "https://yianwillis.github.io/vimcdoc/doc/help.html",
          "open vim help  docs chinese"
        }
      },
      b = {
        "<cmd>call OpenFileWithGoogleChrome()<CR>",
        "open in google chrome",
      },
      u = {
        "<cmd>call OpenCurrentLineURL()<CR>",
        "open url in browser",
      },
    },

    -- project
    ["<leader>p"] = {
      name = "+Project",
    },

    -- quit
    ["<leader>q"] = {
      name = "+Quit",
      q = {
        "<cmd>quitall!<CR>",
        "quit all",
      },
    },

    -- Recent/Replace
    ["<leader>r"] = {
      name = "+Recent/Replace",
    },

    -- search/symbol
    ["<leader>s"] = {
      name = "+Search/Symbol",
      s = {
        "<cmd>write<CR>",
        "save current buffer",
      },
      h = {
        "Highlight world(gd)"
      },
    },

    -- window
    ["<leader>w"] = {
      name = "+Window",
      S = {
        "<cmd>split<CR>",
        "split window to bottom",
      },
      V = {
        "<cmd>vsplit<CR>",
        "split window to right",
      },
      O = {
        "<cmd>only<CR>",
        "close other windows"
      },
    },

    -- text
    ["<leader>x"] = {
      name = "+Text",
      o = {
        "<cmd>call OpenCurrentLineURL()<CR>",
        "open url in browser",
      },
    },

    -- yank/copy
    ["<leader>y"] = {
      name = "+Yank/Copy",
      n = {
        "<cmd>let @+ = expand('%:t')<CR>",
        "Copy current file name"
      },
      p = {
        "<cmd>let @+ = expand('%:p')<CR>",
        "Copy current file absolute path"
      },
      P = {
        "<cmd>let @+ = expand('%')<CR>",
        "Copy current file relative path"
      },
    },

    -- UI toggle
    ["<leader>T"] = {
      name = "+UI toggle"
    },

    -- Bookmarks
    ["<leader>B"] = {
      name = "+Bookmarks",
    },

    -- Packer/Plugin
    ["<leader>P"] = {
      name = "+Packer/treesitter/Mason",
      i = {
        "<cmd>PackerInstall<CR>",
        "install plugins"
      },
      s = {
        "<cmd>PackerSync<CR>",
        "plugins sync(upgrade)"
      },
      S = {
        "<cmd>PackerStatus<CR>",
        "show all plugins status"
      },
      c = {
        "<cmd>PackerClean<CR>",
        "plugins clean"
      },
      t = {
        name = "treesitter",
        i = {
          "<cmd>TSInstallInfo<CR>",
          "treesitter install info[treesitter]"
        },
        c = {
          "<cmd>TSConfigInfo<CR>",
          "treesitter config info[treesitter]"
        },
        m = {
          "<cmd>TSModuleInfo<CR>",
          "treesitter module info[treesitter]"
        },
      }
    },

    -- Markdown
    ["<leader>M"] = {
      name = "+Markdown",
    },

    -- treesitter textobjects move
    ["["] = {
      name = "Move previous",
      m = {
        "",
        "previous function start[textobjects]"
      },
      M = {
        "",
        "previous function end[textobjects]"
      },
      c = {
        "",
        "previous class start[textobjects]"
      },
      C = {
        "",
        "previous class end[textobjects]"
      }
    },
    ["]"] = {
      name = "Move next",
      m = {
        "",
        "next function start[textobjects]",
      },
      M = {
        "",
        "next function end[textobjects]",
      },
      c = {
        "",
        "next class start[textobjects]"
      },
      C = {
        "",
        "next class end[textobjects]"
      }
    },
  });
end

--------------------------------------
-- Visual 菜单
--------------------------------------
local create_visual_menus = function(wk)
  wk.register({
    ["<leader>i"] = {
      name = "+Insert",
      ["l"] = { nil, "insert console.log" },
    },
    ["<leader>c"] = {
      name = "+Comment",
    },
    ["<leader>a"] = {
      name = "+Align",
    },
    ["<leader>j"] = {
      name = "+Jump/join/split",
    },
    ["<leader>r"] = {
      name = "+Replace",
    },
    ["<leader>s"] = {
      name = "+Search/Symbol",
      h = {
        nil,
        "Highlight world(gd)"
      },
    },
    ["<leader>x"] = {
      name = "+Text",
      K = {
        -- "<cmd>move '>+1<CR>gv-gv",
        nil,
        "move line up",
      },
      J = {
        -- "<cmd>move '<-2<CR>gv-gv",
        nil,
        "move line down",
      },
    },
  }, { mode = "v", noremap = false, silent = true })
end

return {
  onstart = function(wk)
    create_noremal_menus(wk);
    create_visual_menus(wk);
  end
};
