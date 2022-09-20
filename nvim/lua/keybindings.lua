-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │             _              _     _           _ _                             │
-- │            | | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___             │
-- │            | |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|            │
-- │            |   <  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \            │
-- │            |_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/            │
-- │                   |___/                             |___/                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
---@diagnostic disable
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                         快捷键配置 & 快捷键菜单配置                          │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local wk = loadModule("which-key", "keybindings");
loadModule("keymenus", "keybindings").onstart(wk);
local keybindings = {}

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                todo 高亮显示                                 │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.todoCommentKeys = function(todoComments)
  wk.register({
    ["<leader>lt"] = {
      "<cmd>TODOTelescope<CR>",
      "list todos"
    },
    ["<leader>jtp"] = {
      todoComments.jump_prev,
      "previous todo[todo-comments]",
    },
    ["<leader>jtn"] = {
      todoComments.jump_next,
      "next todo[todo-comments]",
    }
  })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                               ufo 缩进美化插件                               │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.ufoKeys = function(ufo)
  local previewFold = function()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover();
    end
  end;
  wk.register({
    ["zj"] = {
      ufo.goNextClosedFold,
      "next closed fold[ufo]",
    },
    ["zk"] = {
      ufo.goPreviousClosedFold,
      "prev closed fold[ufo]",
    },
    ["zJ"] = {
      function()
        ufo.goNextClosedFold();
        ufo.peekFoldedLinesUnderCursor();
      end,
      "preview next closed fold[ufo]",
    },
    ["zK"] = {
      function()
        ufo.goPreviousClosedFold();
        ufo.peekFoldedLinesUnderCursor();
      end,
      "preview prev closed fold[ufo]",
    },
    ["zR"] = {
      ufo.openAllFolds,
      "open all folds[ufo]",
    },
    ["zM"] = {
      ufo.closeAllFolds,
      "close all folds[ufo]",
    },
    ["zr"] = {
      ufo.openFoldsExceptKinds,
      "open more folds[ufo]",
    },
    ["zm"] = {
      ufo.closeFoldsWith,
      "close more folds[ufo]",
    },
    ["zp"] = {
      previewFold,
      "preview fold content[ufo]",
    }
  })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                  格式化代码                                  │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.formatterKeys = function(format)
  wk.register({
    ["<leader>ff"] = {
      format,
      "document format[formatter]",
    }
  })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                 预览markdown                                 │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.commentBoxKeys = function()
  local mappings = {
    ["<leader>cb"] = {
      name = "+CommentBox",
      l = {
        [[<cmd>CBcatalog<CR>]],
        "preview lines and boxes",
      },
    },
    ["<leader>cbb"] = {
      [[<cmd>CBlbox<CR>]],
      "text:left length:auto",
    },
    ["<leader>cb1"] = {
      [[<cmd>CBcbox<CR>]],
      "text:center length:fixed",
    },
    ["<leader>cb2"] = {
      [[<cmd>CBacbox<CR>]],
      "text:center length:auto",
    },
  };
  wk.register(mappings);
  wk.register(mappings, { mode = "v", noremap = false, silent = true })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                 预览markdown                                 │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.markdownPreviewKeys = function()
  wk.register({
    ["<leader>Ms"] = {
      "<cmd>MarkdownPreview<CR>",
      "start preview server[markdown-preview]",
    },
    ["<leader>MS"] = {
      "<cmd>MarkdownPreviewStop<CR>",
      "stop preview server[markdown-preview]",
    }
  })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                        nvim-surround 两边围绕字符操作                        │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.nvimSurroundKeys = function()
  return {
    insert          = "<C-g>s",
    insert_line     = "<C-g>S",
    normal          = "ys",
    normal_cur      = "yss",
    normal_line     = "yS",
    normal_cur_line = "ySS",
    visual          = "S",
    visual_line     = "gS",
    delete          = "ds",
    change          = "cs",
  }
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                           nvim-treesitter 语法高亮                           │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.treesitterKeys = function()
  wk.register({
    ["<leader>Pt"] = {
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
  })
  return {
    keymaps = {
      init_selection    = '<CR>',
      node_incremental  = '<CR>',
      node_decremental  = '<BS>',
      scope_incremental = '<TAB>',
    },
    textsubjects_prev_selection = ",",
    textsubjects_keymaps = {
      ['0'] = 'textsubjects-smart',
      ['='] = 'textsubjects-container-outer',
      ['-'] = 'textsubjects-container-inner',
    },
    textobjects_swap_next = {
      ["<leader>An"] = "@parameter.inner",
    },
    textobjects_swap_prev = {
      ["<leader>An"] = "@parameter.inner",
    },
    textobjects_move_goto_next_start = {
      ["]m"] = "@function.outer",
      ["]c"] = "@class.outer",
    },
    textobjects_move_goto_next_end = {
      ["]M"] = "@function.outer",
      ["]C"] = "@class.outer",
    },
    textobjects_goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[c"] = "@class.outer",
    },
    textobjects_goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[C"] = "@class.outer",
    },
    textobjects_select_keymaps = {
      ["sa"] = { query = "@attribute.inner", desc = "attribute inner[textobjects]" },
      ["sA"] = { query = "@attribute.outer", desc = "attribute outer[textobjects]" },
      ["sb"] = { query = "@block.inner", desc = "block inner[textobjects]" },
      ["sB"] = { query = "@block.outer", desc = "block outer[textobjects]" },
      ["sc"] = { query = "@class.inner", desc = "class inner[textobjects]" },
      ["sC"] = { query = "@class.outer", desc = "class outer[textobjects]" },
      ["sf"] = { query = "@function.inner", desc = "function inner[textobjects]" },
      ["sF"] = { query = "@function.outer", desc = "function outer[textobjects]" },
      ["si"] = { query = "@conditional.inner", desc = "conditional inner[textobjects]" },
      ["sI"] = { query = "@conditional.outer", desc = "conditional outer[textobjects]" },
      ["sl"] = { query = "@loop.inner", desc = "loop(for/while) inner[textobjects]" },
      ["sL"] = { query = "@loop.outer", desc = "loop(for/while) outer[textobjects]" },
      ["sp"] = { query = "@parameter.inner", desc = "arguments inner[textobjects]" },
      ["sP"] = { query = "@parameter.outer", desc = "arguments outer[textobjects]" },
    }
  }
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                               切换主题                                       │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.onedarkKeys = function()
  wk.register({
    ["<leader>Tc"] = {
      "<cmd>lua require('onedark').toggle()<CR>",
      "toggle colorscheme[onedark]"
    },
  })
end

keybindings.base16Keys = function(setColorScheme)
  wk.register({
    ["<leader>Tc"] = {
      function()
        setColorScheme();
      end,
      "toggle colorscheme[base16]"
    }
  })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                   书签管理                                   │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.bookmarkKeys = function()
  nnoremap("<F3>", "<Plug>BookmarkToggle<CR>");
  wk.register({
    ["<leader>Bm"] = {
      "<Plug>BookmarkToggle<CR>",
      "toggle bookmark[vim-bookmark]",
    },
    ["<leader>Bp"] = {
      "<Plug>BookmarkPrev<CR>",
      "jump to next bookmark[vim-bookmark]",
    },
    ["<leader>Bn"] = {
      "<Plug>BookmarkNext<CR>",
      "jump to previous bookmark[vim-bookmark]",
    },
  });
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                     注释                                     │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.kommentaryKeys = function()
  -- nnoremap("<C-\\>", "<Plug>kommentary_line_default")
  -- vnoremap("<C-\\>", "<Plug>kommentary_visual_default<C-c>gv-gv")
  wk.register({
    ["<C-\\>"] = {
      "<Plug>kommentary_line_default",
      "toggle comment[kommentary]",
    },
    ["<leader>;"] = {
      "<Plug>kommentary_line_default",
      "comment current line[kommentary]"
    },
    ["<leader>cl"] = {
      "<Plug>kommentary_line_default",
      "comment current line[kommentary]"
    },
  })
  wk.register({
    ["<C-\\>"] = {
      "<Plug>kommentary_visual_default<C-c>gv-gv",
      "toggle comment in selection[kommentary]",
    },
    ["<leader>cL"] = {
      "<Plug>kommentary_visual_default<C-c>gv-gv",
      "comment multi lines[kommentary]"
    },
  }, { mode = "v", silent = true, noremap = true })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                align 代码对齐                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.alignKeys = function(align)
  local options = { noremap = true, silent = true };
  vim.keymap.set("n", "gaw", function()
    align.operator(align.align_to_string, {
      is_pattern = false,
      reverse    = true,
      preview    = false
    })
  end, options);
  vim.keymap.set("n", "gaa", function()
    align.operator(align.align_to_char, {
      is_pattern = false,
      reverse    = true,
      preview    = false
    })
  end, options);
  wk.register({
    ["<leader>aa"] = {
      "<cmd>lua require('align').align_to_string(false,true,false)<CR>",
      "align by string[align]",
    },
    ["<leader>aA"] = {
      "<cmd>lua require('align').align_to_char(1,true,false)<CR>",
      "align by char[align]",
    },
    ["<leader>ap"] = {
      "<cmd>lua require('align').align_to_string(false,true,true)<CR>",
      "align by string(preview)[align]",
    },
    ["<leader>ar"] = {
      "<cmd>lua require('align').align_to_string(true,true,true)<CR>",
      "align by string or pattern(preview)[align]",
    },
  }, { mode = "v" })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                    barbar                                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.barbarKeys = function()
  wk.register({
    ["H"] = {
      "<cmd>BufferPrevious<CR>",
      "previous buffer"
    },
    ["L"] = {
      "<cmd>BufferNext<CR>",
      "next buffer"
    },
    ["<leader>ll"] = {
      "<cmd>Telescope buffers<CR>",
      "show all buffers[barbar]",
    },
    ["<leader>bb"] = {
      "<cmd>BufferLinePick<CR>",
      "show all buffers[barbar]",
    },
    ["<leader>bh"] = {
      "<cmd>BufferMovePrevious<CR>",
      "move buffer to left[barbar]",
    },
    ["<leader>bl"] = {
      "<cmd>BufferMoveNext<CR>",
      "move buffer to right[barbar]",
    },
    ["<leader>bH"] = {
      "<cmd>BufferCloseBuffersLeft<CR>",
      "close left buffers[barbar]",
    },
    ["<leader>bL"] = {
      "<cmd>BufferCloseBuffersRight<CR>",
      "close right buffers[barbar]",
    },
    ["<leader>qH"] = {
      "<cmd>BufferCloseBuffersLeft<CR>",
      "close left buffers[barbar]",
    },
    ["<leader>qL"] = {
      "<cmd>BufferCloseBuffersRight<CR>",
      "close right buffers[barbar]",
    },
    ["<leader>bt"] = {
      "<cmd>BufferPin<CR>",
      "toggle buffer pin status[barbar]",
    },
    ["<leader>bd"] = {
      "<cmd>BufferClose<CR>",
      "close buffer[barbar]",
    },
    ["<leader>bD"] = {
      "<cmd>BufferCloseAllButCurrentOrPinned<CR>",
      "close other buffers[barbar]",
    },
  });
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                               formatter 格式化                               │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.gitsignsKeys = function()
  wk.register({
    ["<leader>g"] = {
      ["f"] = {
        "<cmd>Gitsigns refresh<CR>",
        "refresh gitsigns[gitsigns]",
      },
      ["u"] = {
        "<cmd>Gitsigns undo_stage_hunk<CR>",
        "undo current hunk[gitsigns]",
      },
      ["r"] = {
        "<cmd>Gitsigns reset_hunk<CR>",
        "reset current hunk[gitsigns]",
      },
      ["R"] = {
        "<cmd>Gitsigns reset_buffer<CR>",
        "reset buffer all hunk[gitsigns]",
      },
      ["s"] = {
        "<cmd>Gitsigns stage_hunk<CR>",
        "stage current hunk[gitsigns]",
      },
      ["S"] = {
        "<cmd>Gitsigns stage_buffer<CR>",
        "stage buffer all hunk[gitsigns]",
      },
      ["d"] = {
        "<cmd>Gitsigns diffthis<CR>",
        "diff hunks[gitsigns]",
      },
      ["j"] = {
        "<cmd>Gitsigns next_hunk<CR>",
        "next hunk[gitsigns]",
      },
      ["k"] = {
        "<cmd>Gitsigns prev_hunk<CR>",
        "previous hunk[gitsigns]",
      },
    },
    ["<leader>jc"] = {
      "<cmd>Gitsigns prev_hunk<CR>",
      "jump to previous change[gitsigns]",
    },
    ["<leader>jC"] = {
      "<cmd>Gitsigns prev_hunk<CR>",
      "jump to next change[gitsigns]",
    },
  })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                 hop 快速移动                                 │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.hopKeys = function()
  -- 搜索字符
  nnoremap("s", "<cmd>HopChar1<CR>");

  -- 当前行内搜索字符: f向后搜索, F向前
  nnoremap("f", "<cmd>HopChar1CurrentLineAC<CR>");
  nnoremap("F", "<cmd>HopChar1CurrentLineBC<CR>");

  -- 在当前文件中搜索单词
  wk.register({
    ["<leader>jj"] = {
      "<cmd>HopChar1<CR>",
      "jump to character[hop]",
    },
    ["<leader>jl"] = {
      "<cmd>HopLine<CR>",
      "jump to line[hop]",
    },
    ["<leader>jw"] = {
      "<cmd>HopWord<CR>",
      "jump to word[hop]",
    },
  });
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                 cmp 自动完成                                 │
-- │       docs: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings        │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.cmpKeys = function(cmp)
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  return {
    -- 显示代码提示
    ["<C-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

    -- 选中上一项
    ["<C-k>"] = cmp.mapping.select_prev_item(),

    -- 选中下一项
    ["<C-j>"] = cmp.mapping.select_next_item(),

    -- 确定选中提示
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- 关闭代码提示
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),

    -- 如果窗口内容太多，可以上下滚动(有bug, 坐等官方修复)
    -- ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    -- ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

    -- snippets 上一个位置
    ["<C-h>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end),

    -- snippets 下一个位置
    ["<C-l>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](1) == 1 then
        feedkey("<Plug>(vsnip-jump-next)", "");
      end
    end),

    -- Tab: 下一个提示/展开snippets
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- shift-tab: 上一个提示
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  }
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                          nvim-spectre 搜索替换增强                           │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.spectreKeys = function()
  -- 在当前文件中搜索/替换
  -- nnoremap("<leader>rr", "<cmd>lua require('spectre').open_file_search()<CR>")

  -- 打开全局搜索/替换
  -- nnoremap("<leader>rR", "<cmd>lua require('spectre').open()<CR>")

  -- 选中模式下, 在所有文件中搜索: 被选中单词
  -- vnoremap("<leader>rr", "<esc>:lua require('spectre').open_visual({select_word=true})<CR>")

  wk.register({
    ["<leader>rr"] = {
      "<cmd>lua require('spectre').open_file_search()<CR>",
      "search/replace in buffer[spectre]",
    },
    ["<leader>sF"] = {
      "<cmd>lua require('spectre').open_file_search()<CR>",
      "search/replace in buffer[spectre]",
    },
    ["<leader>rR"] = {
      "<cmd>lua require('spectre').open()<CR>",
      "search/replace in project[spectre]",
    }
  })

  wk.register({
    ["<leader>rr"] = {
      "<esc>:lua require('spectre').open_visual({select_word=true})<CR>",
      "search/replace selection in buffer[spectre]",
    },
    ["<leader>sR"] = {
      "<esc>:lua require('spectre').open_visual({select_word=true})<CR>",
      "search/replace selection in buffer[spectre]",
    }
  }, { mode = "v" })

  return {
    ["toggle_line"] = {
      -- 切换当前行的状态
      map = "dd",
      cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
      desc = "toggle current item",
    },
    ["enter_file"] = {
      -- 进入搜索到结果所在的文件
      map = "<cr>",
      cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
      desc = "goto current file",
    },
    ["run_current_replace"] = {
      -- 替换当前行
      map = "<leader>rc",
      cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
      desc = "replace current line",
    },
    ["run_replace"] = {
      -- 替换所有
      map = "<leader>ra",
      cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
      desc = "replace all",
    },
    ["change_view_mode"] = {
      -- 切换是否替换结果视觉
      map = "<leader>rv",
      cmd = "<cmd>lua require('spectre').change_view()<CR>",
      desc = "change result view mode",
    },
    ["toggle_ignore_case"] = {
      -- 忽略大小写切换
      map = "<leader>ri",
      cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
      desc = "toggle ignore case",
    },
    ["show_option_menu"] = {
      -- 显示菜单
      map = "<leader>ro",
      cmd = "<cmd>lua require('spectre').show_options()<CR>",
      desc = "show option",
    },
  }
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                    vifm 终端管理文件器(功能和rnvimr一样)                     │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.vifmKeys = function()
  wk.register({
    ["<C-n>"] = {
      "<cmd>Vifm<CR>",
      "open vifm[vifm]"
    }
  });
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                            nvimtree 侧边栏目录树                             │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.nvimtreeKeys = function()
  -- Ctrl + t: 切换显示/隐藏
  -- nnoremap("<C-t>", "<cmd>NvimTreeToggle<CR>")
  wk.register({
    ["<C-t>"] = {
      "<cmd>NvimTreeToggle<CR>",
      "toggle NvimTree[nvim-tree]"
    },
    ["<leader>0"] = {
      "<cmd>NvimTreeFocus<CR>",
      "focus on explorer[nvim-tree]"
    },
    ["<leader>fT"] = {
      "<cmd>NvimTreeFocus<CR>",
      "focus in explorer[nvim-tree]"
    },
    ["<leader>pt"] = {
      "<cmd>NvimTreeFocus<CR>",
      "focus in explorer[nvim-tree]"
    },
    ["<leader>oe"] = {
      "<cmd>NvimTreeToggle<CR>",
      "toggle file explorer[nvim-tree]"
    },
    ["<leader>ft"] = {
      "<cmd>NvimTreeToggle<CR>",
      "toggle file explorer[nvim-tree]"
    },
    ["<leader>Rt"] = {
      "<cmd>NvimTreeRefresh<CR>",
      "refresh file explorer[nvim-tree]"
    },
  })

  return {
    { key = "o", action = "edit" }, -- 打开并编辑
    { key = "<CR>", action = "edit" }, -- 打开并编辑
    { key = "<C-\\>", action = "system_open" }, -- 用系统 open 命令打开
    { key = "v", action = "vsplit" }, -- 左右拆分窗口并打开编辑
    { key = "i", action = "toggle_ignored" }, -- 切换忽略
    { key = ".", action = "toggle_dotfiles" }, -- 切换隐藏文件是否可见
    { key = "R", action = "refresh" }, -- 刷新
    { key = "a", action = "create" }, -- 创建文件/目录(/结尾就是目录)
    { key = "r", action = "rename" }, -- 重命名
    { key = "x", action = "remove" }, -- 删除
    { key = "d", action = "cut" }, -- 剪切
    { key = "y", action = "copy" }, -- 复制
    { key = "p", action = "paste" }, -- 粘贴
    { key = "Yn", action = "copy_name" }, -- 复制文件名
    { key = "Yp", action = "copy_path" }, -- 否则文件路径
    { key = "YP", action = "copy_absolute_path" }, -- 复制文件绝对路径
    { key = "I", action = "toggle_file_info" }, -- 查看文件信息
    -- { key = { "]" }, action = "cd" }, -- 切换目录
    -- { key = { "[" }, action = "dir_up" }, -- 切换到上级目录
    -- { key = "n", action = "tabnew" }, -- 不知道干嘛的
  }
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                           session管理工具                                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.sessionManagerKeys = function()
  -- 在退出编辑器之前 & 自动保存当前 session 状态
  wk.register({
    ["<leader>pr"] = {
      "<cmd>SessionManager load_current_dir_session<CR>",
      "load last session[session-manager]",
    },
    ["<leader>pl"] = {
      "<cmd>SessionManager load_session<CR>",
      "switch session[session-manager]",
    },
    ["<leader>pp"] = {
      "<cmd>SessionManager load_session<CR>",
      "switch session[session-manager]",
    },
    ["<leader>pd"] = {
      "<cmd>SessionManager delete_session<CR>",
      "delete sessions[session-manager]",
    },
    ["<leader>ps"] = {
      "<cmd>SessionManager save_current_session<CR>",
      "save sessions[session-manager]",
    },
  })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                              telescope 搜索文件                              │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.telescopeKeys = function(builtin, actions)
  -- nnoremap("<C-p>", "<cmd>Telescope find_files prompt_prefix=[files]<CR>")
  -- nnoremap("<leader>fb", "<cmd>Telescope buffers prompt_prefix=[buffers]<CR>")
  -- nnoremap("<leader>fs", "<cmd>Telescope live_grep prompt_prefix=[string]<CR>")
  -- nnoremap("<leader>fh", "<cmd>Telescope help_tags prompt_prefix=[telescopeHelpTags]<CR>")

  wk.register({
    ["<C-p>"] = {
      "<cmd>Telescope find_files<CR>",
      "search files[telescope]"
    },
    ["<leader><leader>"] = {
      "<cmd>Telescope commands<CR>",
      "search commands[telescope]"
    },
    ["<leader>/"] = {
      "<cmd>Telescope live_grep<CR>",
      "search in project[telescope]"
    },
    ["<leader>?"] = {
      "<cmd>Telescope keymaps<CR>",
      "search keymaps[telescope]"
    },
    ["<leader>bs"] = {
      "<cmd>Telescope buffers<CR>",
      "search buffers[telescope]"
    },
    ["<leader>sf"] = {
      "<cmd>Telescope current_buffer_fuzzy_find<CR>",
      "fuzzy search[telescope]"
    },
    ["<leader>ot"] = {
      "<cmd>Telescope vim_bookmarks all<CR>",
      "open TODO view[telescope]",
    },
    ["<leader>pf"] = {
      "<cmd>Telescope find_files<CR>",
      "find file in project[telescope]",
    },
    ["<leader>sp"] = {
      "<cmd>Telescope live_grep<CR>",
      "search string in project[telescope]",
    },
    ["<leader>sb"] = {
      "<cmd>Telescope buffers<CR>",
      "search buffers[telescope]",
    },
    ["<leader>st"] = {
      "<cmd>TodoTelescope<CR>",
      "search todos[todo-comments]",
    },
    ["<leader>sH"] = {
      "<cmd>Telescope highlights<CR>",
      "search highlights[telescope]",
    },
    ["<leader>Bo"] = {
      "<cmd>Telescope vim_bookmarks all<CR>",
      "open bookmarks explorer[telescope]",
    },
    ["<leader>Bb"] = {
      "<cmd>Telescope vim_bookmarks all<CR>",
      "open bookmarks explorer[telescope]",
    },
    ["<leader>BB"] = {
      "<cmd>Telescope vim_bookmarks all<CR>",
      "open bookmarks explorer[telescope]",
    },
  })

  wk.register({
    ["<leader>sp"] = {
      function()
        builtin.current_buffer_fuzzy_find({
          default_text  = getVisualSelection(),
          prompt_prefix = "[fuzzy]"
        })
      end,
      "search string in buffer with seclection[telescope]",
    },
    ["<leader>sP"] = {
      function()
        builtin.live_grep({
          default_text  = getVisualSelection(),
          prompt_prefix = "[string]"
        })
      end,
      "search string in workspace with seclection[telescope]",
    },
  }, { mode = "v", silent = true, noremap = true });

  return {
    i = {
      -- 在显示 telescope 输入框时, insert 模式的时候
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<M-j>"] = actions.cycle_history_next,
      ["<M-k>"] = actions.cycle_history_prev,
    },
  }
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                          ctrl + x : 打开/关闭命令行                          │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.toggletermKeys = function(getLazygit, getVifm)
  wk.register({
    ["<C-g>"] = {
      function()
        getLazygit():toggle();
      end,
      "toggle lazygit[toggleterm]"
    },
    ["<leader>ov"] = {
      function()
        getVifm():toggle();
      end,
      "toggle vifm[toggleterm]"
    }
  })

  return "<C-x>"; -- toggle terminal
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                  mason 设置                                  │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.lspMasonKeys = function()
  wk.register({
    ["<leader>Pm"] = {
      "<cmd>Mason<CR>",
      "Mason[mason]"
    }
  })
  return {
    toggle_package_expand   = "o", -- 展开
    install_package         = "i", -- 安装
    update_package          = "u", -- 更新
    update_all_packages     = "U", -- 更新所有
    check_package_version   = "c", -- 检查版本
    check_outdated_packages = "C", -- 检查所有
    uninstall_package       = "X", -- 删除
    cancel_installation     = "<C-c>", -- 取消安装
    apply_language_filter   = "<C-f>", -- 筛选
  }
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                               lsp 回调函数设置                               │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.lspKeys = function(client, bufnr)
  -- 自动匹配高亮当前光标下的单词
  local highlight = loadModule("utils.highlight", "keybindings");
  highlight.setup(client, bufnr);

  wk.register({
    -- ["<leader>ff"] = ,
    -- ["gh"] = { -- 查看帮助文档
    --   "<cmd>lua vim.lsp.buf.hover()<CR>",
    --   "LSP hover[lsp]"
    -- },
    -- ["gd"] = { -- 跳到函数定义位置
    --   "<cmd>lua vim.lsp.buf.definition()<CR>",
    --   "LSP goto definition[lsp]"
    -- },
    -- ["gr"] = { -- 查看引用
    --   "<cmd>lua vim.lsp.buf.references()<CR>",
    --   "LSP references[lsp]"
    -- },
    -- ["<leader>ca"] = { -- 快速修复
    --   "<cmd>lua vim.lsp.buf.code_action()<CR>",
    --   "code action quickFix[lsp]"
    -- },
    -- ["<leader>ji"] = { -- 打开 outline
    --   "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
    --   "jump to symbol in buffer[lsp]"
    -- },
    -- ["<leader>ls"] = { -- 打开 outline
    --   "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
    --   "show symbols[lsp]"
    -- },
    -- ["<leader>sj"] = { -- 打开 outline
    --   "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
    --   "show symbols[lsp]"
    -- },
    -- ["<leader>sr"] = { -- 查看引用
    --   "<cmd>lua vim.lsp.buf.references()<CR>",
    --   "search all references[lsp]"
    -- },
    -- ["<leader>xa"] = { -- 查看引用
    --   "<cmd>lua vim.lsp.buf.references()<CR>",
    --   "find all references[lsp]"
    -- },
    -- ["<leader>xr"] = { -- 查看引用
    --   "<cmd>lua vim.lsp.buf.references()<CR>",
    --   "find all references[lsp]"
    -- },
    -- ["<seader>se"] = { -- 重命名变量
    --   "<cmd>lua vim.lsp.buf.rename()<CR>",
    --   "rename symbol[lsp]"
    -- },
    -- ["<leader>rn"] = { -- 重命名变量
    --   "<cmd>lua vim.lsp.buf.rename()<CR>",
    --   "rename symbol[lsp]"
    -- },
    ["<leader>sJ"] = { -- 搜索symbol
      "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
      "jump to symbol in project[lsp]",
    },
    ["<leader>jI"] = { -- 搜索symbol
      "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
      "jump to symbol in project[lsp]",
    },
  })
  -- 格式化选中模式
  wk.register({
    ["<leader>j="] = {
      "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
      "format selection[lsp]"
    },
    -- ["<leader>rn"] = {
    --   "<cmd>lua vim.lsp.buf.rename()<CR>",
    --   "edit symbol name[lsp]"
    -- },
    -- ["<leader>se"] = {
    --   "<cmd>lua vim.lsp.buf.rename()<CR>",
    --   "edit symbol name[lsp]"
    -- },
    -- ["<leader>xr"] = {
    --   "<cmd>lua vim.lsp.buf.rename()<CR>",
    --   "rename symbol[lsp]"
    -- },
  }, { mode = "v", silent = true, noremap = true })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                            lspsaga 自定义插件设置                            │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.lspsagaKeys = function()
  -- 跳到上/下/错误一个代码诊断提示位置
  wk.register({
    ["gh"] = { -- 查看帮助文档
      "<cmd>Lspsaga hover_doc<CR>",
      "Lspsaga hover[lspsaga]"
    },
    ["gd"] = { -- 跳到函数定义位置
      "<cmd>Lspsaga lsp_finder<CR>",
      "Lspsaga finder[lspsaga]"
    },
    ["gr"] = {
      "<cmd>Lspsaga lsp_finder<CR>",
      "find all references[lspsaga]"
    },
    ["<leader>ej"] = { -- 下一个错误
      "<cmd>Lspsaga diagnostic_jump_next<CR>",
      "next error[lspsaga]"
    },
    ["<leader>ek"] = { -- 上一个错误
      "<cmd>Lspsaga diagnostic_jump_prev<CR>",
      "previous error[lspsaga]"
    },
    ["<leader>ca"] = { -- 快速修复
      "<cmd>Lspsaga code_action<CR>",
      "code action quickFix[lspsaga]"
    },
    ["<leader>ji"] = { -- 打开 outline
      "<cmd>LSoutlineToggle<CR>",
      "jump to symbol in buffer[lspsaga]"
    },
    ["<leader>ls"] = { -- 打开 outline
      "<cmd>LSoutlineToggle<CR>",
      "show symbols[lspsaga]"
    },
    ["<leader>sj"] = { -- 打开 outline
      "<cmd>LSoutlineToggle<CR>",
      "jump to symbol in outline[lspsaga]"
    },
    ["<leader>sr"] = { -- 查看引用
      "<cmd>Lspsaga lsp_finder<CR>",
      "search all references[lspsaga]"
    },
    ["<leader>xa"] = { -- 查看引用
      "<cmd>Lspsaga lsp_finder<CR>",
      "find all references[lspsaga]"
    },
    ["<leader>xr"] = { -- 查看引用
      "<cmd>Lspsaga lsp_finder<CR>",
      "find all references[lspsaga]"
    },
    ["<leader>se"] = { -- 重命名变量()
      "<cmd>Lspsaga rename<CR>",
      "edit symbol name[lsp]"
    },
    ["<leader>rn"] = { -- 重命名变量
      "<cmd>Lspsaga rename<CR>",
      "rename symbol[lspsaga]"
    }
  });
  wk.register({
    ["<leader>rn"] = { -- 重命名变量
      "<cmd>Lspsaga rename<CR>",
      "edit symbol name[lsp]"
    },
    ["<leader>se"] = { -- 重命名变量
      "<cmd>Lspsaga rename<CR>",
      "edit symbol name[lsp]"
    },
    ["<leader>xr"] = { -- 重命名变量
      "<cmd>Lspsaga rename<CR>",
      "rename symbol[lsp]"
    },
  }, { mode = "v" })

  return {
    move_in_saga       = {
      prev = '<C-k>', -- k 选中上一项
      next = '<C-j>' -- j 选中下一项
    },
    finder_action_keys = {
      open        = "o", -- 进入当前行所在位置
      vsplit      = "s", -- 左右分屏
      split       = "i", -- 上下分屏
      tabe        = "t",
      quit        = "<ESC>", -- 退出finder
      scroll_down = "<C-u>", -- 向上滚动
      scroll_up   = "<C-d>", -- 向下滚动
    },
    code_action_keys   = {
      quit = "<ESC>", -- 退出修复
      exec = "<CR>", -- 执行修复
    },
    rename_action_quit = "<ESC>", -- 退出重命名
    outline_enter_key  = "o", -- 进入 symbol 对应的文件位置
  }
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                   dap 调试                                   │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.dapKeys = function()
  -- TODO: 不全, 查阅: https://github.com/mfussenegger/nvim-dap 尽量和 vscode 保持一致
  -- nnoremap("<F3>", "<cmd>lua require'dap'.toggle_breakpoint(); require'user.dap.dap-util'.store_breakpoints(true)<cr>");
  -- 标记断点
  -- nnoremap("<F4>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")

  -- -- 开启调试
  -- nnoremap("<F5>", "<cmd>lua require'dap'.continue()<CR>")

  -- -- 步入
  -- nnoremap("<F6>", "<cmd>lua require'dap'.step_into()<CR>")

  -- -- 步出
  -- nnoremap("<F7>", "<cmd>lua require'dap'.step_out()<CR>")

  -- -- 结束当前函数
  -- nnoremap("<F8>", "<cmd>lua require'dap'.step_over()<CR>")

  -- -- 重启
  -- nnoremap("<F9>", "<cmd>lua require'dap'.run_last()<CR>")

  -- -- 终止调试
  -- nnoremap("<F10>", "<cmd>lua require'dap'.terminate()<CR>")

  -- 菜单
  wk.register({
    ["<F4>"] = {
      "<cmd>lua require('dap').toggle_breakpoint()<CR>",
      "toggle breakpoint(F4)[dap]"
    },
    ["<leader>db"] = {
      "<cmd>lua require('dap').toggle_breakpoint()<CR>",
      "toggle breakpoint(F4)[dap]"
    },
    ["<F5>"] = {
      "<cmd>lua require('dap').continue()<CR>",
      "continue debug(F5)[dap]"
    },
    ["<leader>dd"] = {
      "<cmd>lua require('dap').continue()<CR>",
      "continue debug(F5)[dap]"
    },
    ["<F6>"] = {
      "<cmd>lua require('dap').step_into()<CR>",
      "debug step in(F6)[dap]"
    },
    ["<leader>di"] = {
      "<cmd>lua require('dap').step_into()<CR>",
      "debug step in(F6)[dap]"
    },
    ["<F7>"] = {
      "<cmd>lua require('dap').step_out()<CR>",
      "debug step out(F7)[dap]"
    },
    ["<leader>do"] = {
      "<cmd>lua require('dap').step_out()<CR>",
      "debug step out(F7)[dap]"
    },
    ["<F8>"] = {
      "<cmd>lua require('dap').step_over()<CR>",
      "debug step over(F8)[dap]"
    },
    ["<leader>ds"] = {
      "<cmd>lua require('dap').step_over()<CR>",
      "debug step over(F8)[dap]"
    },
    ["<F9>"] = {
      "<cmd>lua require('dap').run_last()<CR>",
      "debug step out(F9)[dap]"
    },
    ["<leader>dR"] = {
      "<cmd>lua require('dap').run_last()<CR>",
      "debug step out(F9)[dap]"
    },
    ["<F10>"] = {
      "<cmd>lua require('dap').terminate()<CR>",
      "stop debug(F10)[dap]"
    },
    ["<leader>dS"] = {
      "<cmd>lua require('dap').terminate()<CR>",
      "stop debug(F10)[dap]"
    }
  })
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                    dapUI                                     │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
keybindings.dapUIKeys = function()
  return {
    mappings = {
      expand = { "<CR>" },
      open   = "o",
      remove = "d",
      edit   = "e",
      repl   = "r",
      toggle = "t",
    },
    floatingMappings = {
      close = { "q", "<Esc>" },
    },
  }
end

return keybindings
