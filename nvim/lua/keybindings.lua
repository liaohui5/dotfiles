--  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .-----------------. .----------------.
-- | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
-- | |   ______     | || |   _____      | || | _____  _____ | || |    ______    | || |     _____    | || | ____  _____  | || |    _______   | |
-- | |  |_   __ \   | || |  |_   _|     | || ||_   _||_   _|| || |  .' ___  |   | || |    |_   _|   | || ||_   \|_   _| | || |   /  ___  |  | |
-- | |    | |__) |  | || |    | |       | || |  | |    | |  | || | / .'   \_|   | || |      | |     | || |  |   \ | |   | || |  |  (__ \_|  | |
-- | |    |  ___/   | || |    | |   _   | || |  | '    ' |  | || | | |    ____  | || |      | |     | || |  | |\ \| |   | || |   '.___`-.   | |
-- | |   _| |_      | || |   _| |__/ |  | || |   \ `--' /   | || | \ `.___]  _| | || |     _| |_    | || | _| |_\   |_  | || |  |`\____) |  | |
-- | |  |_____|     | || |  |________|  | || |    `.__.'    | || |  `._____.'   | || |    |_____|   | || ||_____|\____| | || |  |_______.'  | |
-- | |              | || |              | || |              | || |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
--  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .-----------------. .----------------.
-- | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
-- | | ____    ____ | || |      __      | || |   ______     | || |   ______     | || |     _____    | || | ____  _____  | || |    ______    | |
-- | ||_   \  /   _|| || |     /  \     | || |  |_   __ \   | || |  |_   __ \   | || |    |_   _|   | || ||_   \|_   _| | || |  .' ___  |   | |
-- | |  |   \/   |  | || |    / /\ \    | || |    | |__) |  | || |    | |__) |  | || |      | |     | || |  |   \ | |   | || | / .'   \_|   | |
-- | |  | |\  /| |  | || |   / ____ \   | || |    |  ___/   | || |    |  ___/   | || |      | |     | || |  | |\ \| |   | || | | |    ____  | |
-- | | _| |_\/_| |_ | || | _/ /    \ \_ | || |   _| |_      | || |   _| |_      | || |     _| |_    | || | _| |_\   |_  | || | \ `.___]  _| | |
-- | ||_____||_____|| || ||____|  |____|| || |  |_____|     | || |  |_____|     | || |    |_____|   | || ||_____|\____| | || |  `._____.'   | |
-- | |              | || |              | || |              | || |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
------------------------------------------------------------------------------
--  插件的快捷键配置
------------------------------------------------------------------------------
---@diagnostic disable: param-type-mismatch
local wk = require("which-key");
local keybindings = {}

--------------------------------------
-- kommentary 注释快捷键
--------------------------------------
keybindings.onedarkKeys = function ()
  wk.register({
    ["<leader>Tc"] = {
      "<cmd>lua require('onedark').toggle()<CR>",
      "toggle colorscheme[onedark]"
    },
  })
end

--------------------------------------
-- 书签管理快捷键
--------------------------------------
keybindings.bookmarkKeys = function ()
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

--------------------------------------
-- kommentary 注释快捷键
--------------------------------------
keybindings.kommentaryKeys = function()
  nnoremap("<C-\\>", "<Plug>kommentary_line_default")
  vnoremap("<C-\\>", "<Plug>kommentary_visual_default<C-c>gv-gv")
  wk.register({
    ["<leader>;"] = {
      "<Plug>kommentary_line_default",
      "comment current line(<C-\\>)[kommentary]"
    },
    ["<leader>cl"] = {
      "<Plug>kommentary_line_default",
      "comment current line(<C-\\>)[kommentary]"
    },
  })
  wk.register({
    ["<leader>cL"] = {
      "<Plug>kommentary_visual_default<C-c>gv-gv",
      "comment multi lines(<C-\\>)[kommentary]"
    },
  }, { mode = "v" })
end

--------------------------------------
-- align 代码对齐快捷键
--------------------------------------
keybindings.alignKeys = function()
  wk.register({
    ["<leader>aa"] = {
      "<cmd>lua require('align').align_to_string(false,true,true)<CR>",
      "align code by string[align]",
    },
    ["<leader>aA"] = {
      "<cmd>lua require('align').align_to_string(true,true,true)<CR>",
      "align code by pattern[align]",
    }
  }, { mode = "v" })
end

--------------------------------------
-- bufferline 快捷键
--------------------------------------
keybindings.bufferlineKeys = function()
  wk.register({
    ["<leader>bb"] = {
      "<cmd>BufferLinePick<CR>",
      "show all buffers[bufferline]",
    },
    ["<leader>bh"] = {
      "<cmd>BufferLineMovePrev<CR>",
      "move buffer to left",
    },
    ["<leader>bl"] = {
      "<cmd>BufferLineMoveNext<CR>",
      "move buffer to right",
    },
    ["<leader>bH"] = {
      "<cmd>BufferLineCloseLeft<CR>",
      "close left buffers",
    },
    ["<leader>bL"] = {
      "<cmd>BufferLineCloseRight<CR>",
      "close right buffers",
    },
    ["<leader>qH"] = {
      "<cmd>BufferLineCloseLeft<CR>",
      "close left buffers",
    },
    ["<leader>qL"] = {
      "<cmd>BufferLineCloseRight<CR>",
      "close right buffers",
    },
    ["<leader>bt"] = {
      "<cmd>BufferLineTogglePin<CR>",
      "toggle buffer pin status",
    },
  });
end

--------------------------------------
-- formatter 格式化快捷键
--------------------------------------
keybindings.formatterKeys = function()
  wk.register({
    ["<leader>ff"] = {
      "<cmd>FormatWrite<CR>",
      "format and save current buffer[formatter]",
    }
  })
end

--------------------------------------
-- formatter 格式化快捷键
--------------------------------------
keybindings.gitsignsKeys = function()
  wk.register({
    ["<leader>gH"] = {
      name = "+Gitsigns hunks[gitsigns]",
    },
    ["<leader>gHu"] = {
      "<cmd>Gitsigns undo_stage_hunk<CR>",
      "undo current hunk",
    },
    ["<leader>gHr"] = {
      "<cmd>Gitsigns reset_buffer<CR>",
      "reset all hunk in current file",
    },
    ["<leader>gHs"] = {
      "<cmd>Gitsigns stage_hunk<CR>",
      "stage current hunk",
    },
    ["<leader>gHS"] = {
      "<cmd>Gitsigns stage_buffer<CR>",
      "stage all hunk in current file",
    },
    ["<leader>gHd"] = {
      "<cmd>Gitsigns diffthis<CR>",
      "diff hunks[like git diff]",
    },
    ["<leader>gHj"] = {
      "<cmd>Gitsigns next_hunk<CR>",
      "next hunk",
    },
    ["<leader>gHk"] = {
      "<cmd>Gitsigns prev_hunk<CR>",
      "previous hunk",
    },
    ["<leader>jc"] = {
      "<cmd>Gitsigns prev_hunk<CR>",
      "jump to previous change[gitsigns]",
    },
    ["<leader>jC"] = {
      "<cmd>Gitsigns prev_hunk[gitsigns]<CR>",
      "jump to next change",
    },
  })
end

--------------------------------------
-- hop 快速移动快捷键
--------------------------------------
keybindings.hopKeys = function()
  -- 当前行内搜索字符: f向后搜索, F向前
  nnoremap("f", "<cmd>lua require'hop'.hint_char1({direction=require'hop.hint'.HintDirection.AFTER_CURSOR,current_line_only=true})<CR>")
  nnoremap("F", "<cmd>lua require'hop'.hint_char1({direction=require'hop.hint'.HintDirection.BEFORE_CURSOR,current_line_only=true})<CR>")

  -- 在当前文件中搜索单词
  -- nmap("s", "<cmd>HopChar1<CR>")
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

--------------------------------------
-- cmp 自动完成快捷键
-- docs: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
--------------------------------------
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

--------------------------------------
-- nvim-spectre 搜索替换增强插件快捷键
--------------------------------------
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

--------------------------------------
-- nvimtree 侧边栏目录树快捷键
--------------------------------------
keybindings.nvimtreeKeys = function()
  -- Ctrl + t: 切换显示/隐藏
  nnoremap("<C-t>", "<cmd>NvimTreeToggle<CR>")
  wk.register({
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
    }
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
    { key = { "]" }, action = "cd" }, -- 切换目录
    { key = { "[" }, action = "dir_up" }, -- 切换到上级目录
    -- { key = "n", action = "tabnew" },              -- 不知道干嘛的
  }
end

--------------------------------------
-- session session管理工具快捷键
--------------------------------------
keybindings.sessionManagerKeys = function()
  -- 打开session列表, 加载某个session
  -- nnoremap("<leader>pm", "<cmd>SessionManager load_session<CR>")
  -- nnoremap("<leader>pd", "<cmd>SessionManager delete_session<CR>")
  -- nnoremap("<leader>ps", "<cmd>SessionManager save_current_session<CR>")

  -- 在退出编辑器之前 & 自动保存当前 session 状态
  wk.register({
    ["<leader>op"] = {
      "<cmd>SessionManager load_session<CR>",
      "open session manager[session-manager]",
    },
    ["<leader>pl"] = {
      "<cmd>SessionManager load_session<CR>",
      "switch session[session-manager]",
    },
    ["<leader>pp"] = {
      "<cmd>SessionManager load_session<CR>",
      "switch session[session-manager]",
    },
    ["<leader>pe"] = {
      "<cmd>SessionManager delete_session<CR>",
      "delete sessions[session-manager]",
    },
    ["<leader>ps"] = {
      "<cmd>SessionManager save_current_session<CR>",
      "save sessions[session-manager]",
    },
    ["<leader>qs"] = {
      function ()
        vim.cmd [[
          :SessionManager save_current_session
          :quitall!
        ]]
      end,
      "save session before quit",
    },
  })
end

--------------------------------------
-- telescope 搜索文件快捷键
--------------------------------------
keybindings.telescopeKeys = function()
  nnoremap("<C-p>", "<cmd>Telescope find_files prompt_prefix=[files]<CR>")
  -- nnoremap("<leader>fb", "<cmd>Telescope buffers prompt_prefix=[buffers]<CR>")
  -- nnoremap("<leader>fs", "<cmd>Telescope live_grep prompt_prefix=[string]<CR>")
  -- nnoremap("<leader>fh", "<cmd>Telescope help_tags prompt_prefix=[telescopeHelpTags]<CR>")

  wk.register({
    ["<leader>/"] = {
      "<cmd>Telescope live_grep prompt_prefix=[string]<CR>",
      "search in project[telescope]"
    },
    ["<leader>bs"] = {
      "<cmd>Telescope buffers prompt_prefix=[buffers]<CR>",
      "search buffers[telescope]"
    },
    ["<leader>ot"] = {
      "<cmd>Telescope vim_bookmarks all prompt_prefix=[bookmarks]<CR>",
      "open TODO view[telescope]",
    },
    ["<leader>pf"] = {
      "<cmd>Telescope find_files prompt_prefix=[files]<CR>",
      "find file in project[telescope]",
    },
    ["<leader>sp"] = {
      "<cmd>Telescope live_grep prompt_prefix=[string]<CR>",
      "search string in project[telescope]",
    },
    ["<leader>Bo"] = {
      "<cmd>Telescope vim_bookmarks all prompt_prefix=[bookmarks]<CR>",
      "open bookmarks explorer[telescope]",
    },
    ["<leader>Bb"] = {
      "<cmd>Telescope vim_bookmarks all prompt_prefix=[bookmarks]<CR>",
      "open bookmarks explorer[telescope]",
    },
    ["<leader>BB"] = {
      "<cmd>Telescope vim_bookmarks all prompt_prefix=[bookmarks]<CR>",
      "open bookmarks explorer[telescope]",
    },
  })

  -- TODO: search string in project with seclection
   wk.register({
    ["<leader>sP"] = {
      "<cmd>Telescope live_grep prompt_prefix=[string]<CR>",
      "search string in project with seclection[telescope]",
    },
  });

  local actions = require("telescope.actions")
  return {
    i = {
      -- 在显示 telescope 输入框时, insert 模式的时候快捷键
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<M-j>"] = actions.cycle_history_next,
      ["<M-k>"] = actions.cycle_history_prev,
    },
  }
end

--------------------------------------
-- alt(meta) + t: 打开/关闭命令行快捷键
--------------------------------------
keybindings.toggletermKeys = function()
  return [[<C-c>]] -- 注意是一个字符串
end

--------------------------------------
-- mason 快捷键设置
--------------------------------------
keybindings.lspMasonKeys = function()
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

--------------------------------------
-- lsp 回调函数快捷键设置
--------------------------------------
keybindings.lspKeys = function(client, bufnr)
  -- 自动匹配高亮当前光标下的单词
  require("utils.highlight").setup(client, bufnr);

  -- 利用 LSP 格式化, 如果支持的话
  if client.resolved_capabilities.document_formatting then
    wk.register({
      ["<leader>ff"] = {
        "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>",
        "format and save current file[lsp]"
      },
    });
  end
  wk.register({
    ["<leader>j+"] = {
      "<cmd>lua vim.lsp.buf.formatting()<CR>",
      "format current buffer[lsp]",
    },
    -- ["<leader>ca"] = {
    --   "<cmd>lua vim.lsp.buf.code_action()<CR>",
    --   "code action quickFix[lsp]"
    -- },
    -- ["<leader>se"] = {
    --   "<cmd>lua vim.lsp.buf.rename()<CR>",
    --   "edit symbol name[lsp]"
    -- },
    -- ["<leader>xr"] = {
    --   "<cmd>lua vim.lsp.buf.rename()<CR>",
    --   "rename symbol[lsp]"
    -- },
    -- ["<leader>sj"] = {
    --   "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
    --   "jump to symbol in buffer[lsp]"
    -- },
    ["<leader>sJ"] = {
      "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
      "jump to symbol in project[telescope]",
    },
    ["<leader>jI"] = {
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
    ["<leader>se"] = {
      "<cmd>lua vim.lsp.buf.rename()<CR>",
      "edit symbol name[lsp]"
    },
    ["<leader>xr"] = {
      "<cmd>lua vim.lsp.buf.rename()<CR>",
      "rename symbol[lsp]"
    },
  }, { mode = "v" })
end


--------------------------------------
-- lspsaga 自定义插件快捷键设置
--------------------------------------
keybindings.lspsagaKeys = function()
  -- 查看帮助文档
  nnoremap("gh", "<cmd>Lspsaga hover_doc<CR>");

  -- 查看文件定义
  nnoremap("gd", "<cmd>Lspsaga lsp_finder<CR>");

  -- 参看函数定义
  nnoremap("gv", "<cmd>Lspsaga preview_definition<CR>");

  -- 查看文件预览
  -- nnoremap("gl", "<cmd>LSoutlineToggle<CR>");

  -- 跳到上/下/错误一个代码诊断提示位置
  wk.register({
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
      "fix error[lspsaga]"
    },
    ["<leader>ji"] = { -- 打开 outline
      "<cmd>LSoutlineToggle<CR>",
      "jump to symbol in buffer[lspsaga]"
    },
    ["<leader>sj"] = { -- 打开 outline
      "<cmd>LSoutlineToggle<CR>",
      "jump to symbol in buffer[lspsaga]"
    },
    ["<leader>sr"] = { -- 查看引用
      "<cmd>Lspsaga lsp_finder<CR>",
      "search all references[lspsaga]"
    },
    ["<leader>xa"] = { -- 查看引用
      "<cmd>Lspsaga lsp_finder<CR>",
      "find all references[lspsaga]"
    },
    ["<leader>xr"] = { -- gd: 查看引用
      "<cmd>Lspsaga lsp_finder<CR>",
      "find all references[lspsaga]"
    },
    ["<leader>se"] = { -- 重命名变量
      "<cmd>Lspsaga rename<CR>",
      "edit symbol name[lsp]"
    },
    ["<leader>rn"] = { -- 重命名变量
      "<cmd>Lspsaga rename<CR>",
      "rename symbol[lspsaga]"
    }
  });
  wk.register({
    ["<leader>se"] = { -- 重命名变量
      "<cmd>Lspsaga rename<CR>",
      "edit symbol name[lsp]"
    },
  }, {mode = "v"})

  return {
    move_in_saga = {
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
    code_action_keys = {
      quit = "<ESC>", -- 退出修复
      exec = "<CR>", -- 执行修复
    },
    rename_action_quit = "<ESC>", -- 退出重命名
    outline_enter_key  = "o",     -- 进入 symbol 对应的文件位置
  }
end

--------------------------------------
-- dap 调试快捷键
--------------------------------------
keybindings.dapKeys = function()
  -- TODO: 快捷键不全, 查阅: https://github.com/mfussenegger/nvim-dap 尽量和 vscode 保持一致
  -- nnoremap("<F3>", "<cmd>lua require'dap'.toggle_breakpoint(); require'user.dap.dap-util'.store_breakpoints(true)<cr>");
  -- 标记断点
  nnoremap("<F4>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")

  -- 开启调试
  nnoremap("<F5>", "<cmd>lua require'dap'.continue()<CR>")

  -- 步入
  nnoremap("<F6>", "<cmd>lua require'dap'.step_into()<CR>")

  -- 步出
  nnoremap("<F7>", "<cmd>lua require'dap'.step_out()<CR>")

  -- 结束当前函数
  nnoremap("<F8>", "<cmd>lua require'dap'.step_over()<CR>")

  -- 重启
  nnoremap("<F9>", "<cmd>lua require'dap'.run_last()<CR>")

  -- 终止调试
  nnoremap("<F10>", "<cmd>lua require'dap'.terminate()<CR>")

  -- 快捷键菜单
  wk.register({
    ["<leader>db"] = {
      "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
      "toggle breakpoint(F4)[dap]"
    },
    ["<leader>dd"] = {
      "<cmd>lua require'dap'.continue()<CR>",
      "continue debug(F5)[dap]"
    },
    ["<leader>di"] = {
      "<cmd>lua require'dap'.step_into()<CR>",
      "debug step in(F6)[dap]"
    },
    ["<leader>do"] = {
      "<cmd>lua require'dap'.step_out()<CR>",
      "debug step out(F7)[dap]"
    },
    ["<leader>ds"] = {
      "<cmd>lua require'dap'.step_over()<CR>",
      "debug step over(F8)[dap]"
    },
    ["<leader>dR"] = {
      "<cmd>lua require'dap'.run_last()<CR>",
      "debug step out(F9)[dap]"
    },
    ["<leader>dS"] = {
      "<cmd>lua require'dap'.terminate()<CR>",
      "stop debug(F10)[dap]"
    }
  })
end

--------------------------------------
-- dapUI 快捷键
--------------------------------------
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
