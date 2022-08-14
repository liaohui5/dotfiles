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
local keybindings = {}

--------------------------------------
-- aerial 自动完成快捷键
--------------------------------------
keybindings.aerialKeys = function()
  nnoremap("<leader>=", "<cmd>AerialToggle!<CR>")
  nnoremap("[a", "<cmd>AerialPrev<CR>")
  nnoremap("]a", "<cmd>AerialNext<CR>")
end

--------------------------------------
-- align 自动完成快捷键
--------------------------------------
keybindings.alignKeys = function(align)
  local keyset = vim.keymap.set
  local options = { noremap = true, silent = true }

  -- 根据字符串对齐
  keyset("x", "aa", function()
    align.align_to_string(false, true, true)
  end, options)

  keyset("x", "aA", function()
    align.align_to_string(true, true, true)
  end, options)

  -- 对齐 & 预览
  vim.keymap.set("n", "ga", function()
    align.operator(align.align_to_string, {
      is_pattern = false,
      reverse = true,
      preview = true,
    })
  end, options)
end

--------------------------------------
-- bufferline 快捷键
--------------------------------------
keybindings.bufferlineKeys = function()
  nnoremap("<leader>l", ":BufferLinePick<CR>")
end

--------------------------------------
-- formatter 格式化快捷键
--------------------------------------
keybindings.formatterKeys = function()
  nnoremap("<leader>ff", ":FormatWrite<CR>")
end

--------------------------------------
-- formatter 格式化快捷键
--------------------------------------
keybindings.gitsignsKeys = function()
  nnoremap("[h", ":Gitsigns next_hunk<CR>")
  nnoremap("]h", ":Gitsigns prev_hunk<CR>")
  nnoremap("<leader>hR", ":Gitsigns reset_buffer<CR>")
  nnoremap("<leader>hr", ":Gitsigns reset_hunk<CR>")
  nnoremap("<leader>hS", ":Gitsigns stage_hunk<CR>")
  nnoremap("<leader>hs", ":Gitsigns stage_buffer<CR>")
  nnoremap("<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
  nnoremap("<leader>hd", ":Gitsigns diffthis<CR>")
end

--------------------------------------
-- hop 自动完成快捷键
--------------------------------------
keybindings.hopKeys = function()
  -- 当前行内搜索字符: f向后搜索, F向前
  nnoremap(
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
  )
  nnoremap(
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
  )

  -- 在当前文件中搜索单词
  nnoremap("s", ":HopChar1<CR>")
  nnoremap("<leader>w", ":HopWord<CR>")
  nnoremap("<leader>j", ":HopLine<CR>")
  nnoremap("<leader>k", ":HopLine<CR>")
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
    ["<C-h>"] = cmp.mapping(function(fallback)
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end),

    -- snippets 下一个位置
    ["<C-l>"] = cmp.mapping(function(fallback)
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
    ["<S-Tab>"] = cmp.mapping(function(fallback)
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
  nnoremap("<leader>rr", "<cmd>lua require('spectre').open_file_search()<CR>")

  -- 打开全局搜索/替换
  nnoremap("<leader>rg", "<cmd>lua require('spectre').open()<CR>")

  -- 选中模式下, 在所有文件中搜索: 被选中单词
  vnoremap("<leader>rr", "<esc>:lua require('spectre').open_visual({select_word=true})<CR>")

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
      map = "ti",
      cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
      desc = "toggle ignore case",
    },
    ["show_option_menu"] = {
      -- 显示菜单
      map = "<leader>rm",
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
  nnoremap("<C-t>", ":NvimTreeToggle<CR>")

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
  nnoremap("<leader>pm", ":SessionManager load_session<CR>")
  nnoremap("<leader>pd", ":SessionManager delete_session<CR>")
  -- nnoremap("<leader>ps", ":SessionManager save_current_session<CR>")

  -- 在退出编辑器之前 & 自动保存当前 session 状态
  vim.cmd [[
    function SaveSessionBeforeQuit()
      :SessionManager save_current_session
      :quitall!
    endfunction
    nnoremap <leader>q :call SaveSessionBeforeQuit()<CR>
  ]]
end

--------------------------------------
-- telescope projects 项目管理工具快捷键
--------------------------------------
keybindings.projectsKeys = function()
  -- 因为功能和 sessionManager 非常相似,
  -- 二者开启一个就好了, 所以用一样快捷键
  nnoremap("<leader>pm", ":Telescope projects<CR>");
end

--------------------------------------
-- telescope 搜索文件快捷键
--------------------------------------
keybindings.telescopeKeys = function()
  nnoremap("<C-p>", "<cmd>Telescope find_files prompt_prefix=🔍[files]<CR>")
  nnoremap("<leader>fb", "<cmd>Telescope buffers prompt_prefix=🔍[buffers]<CR>")
  nnoremap("<leader>fs", "<cmd>Telescope live_grep prompt_prefix=🔍[string]<CR>")
  nnoremap("<leader>fh", "<cmd>Telescope help_tags prompt_prefix=🔍[telescopeHelpTags]<CR>")

  -- 查看所有书签
  nnoremap("<leader>fm", ":Telescope vim_bookmarks all prompt_prefix=🔍[bookmarks]<CR>")

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
  return [[<M-t>]] -- 注意是一个字符串
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
  local bufkeyset = vim.api.nvim_buf_set_keymap
  local opt = { noremap = true, silent = true }

  -- 自动匹配高亮当前光标下的单词
  require("utils.highlight").setup(client, bufnr);

  -- 利用 LSP 格式化, 如果支持的话
  if client.resolved_capabilities.document_formatting then
    bufkeyset(bufnr, "n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>", opt);
  end

  -- 变量重命名
  -- bufkeyset(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)

  -- code action
  -- bufkeyset(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)

  -- 查看代码定义的位置(需要 telescope 插件)
  -- bufkeyset(bufnr, "n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", opt)

  -- 显示帮助, 改用 lsp-saga 的方法
  -- bufkeyset(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
end


--------------------------------------
-- lspsaga 自定义插件快捷键设置
--------------------------------------
keybindings.lspUISagaKeys = function()
  local floaterm = require("lspsaga.floaterm");

  -- 变量重命名
  nnoremap("<leader>rn", "<cmd>Lspsaga rename<CR>");

  -- 代码修复,小灯泡 code action
  nnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>");

  -- 查看帮助文档
  nnoremap("gh", "<cmd>Lspsaga hover_doc<CR>");

  -- 查看文件定义
  nnoremap("gd", "<cmd>Lspsaga lsp_finder<CR>");

  -- 参看函数定义
  nnoremap("gv", "<cmd>Lspsaga preview_definition<CR>");

  -- 查看文件预览
  nnoremap("gl", "<cmd>LSoutlineToggle<CR>");

  -- 跳到上/下/错误一个代码诊断提示位置
  nnoremap("]e", "<cmd>Lspsaga diagnostic_jump_next<CR>");
  nnoremap("[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>");

  -- 终端(打开时,可以自动执行一个命令, 如: <cmd>Lspsaga open_floaterm ranger<CR>)
  nnoremap("<C-c>", "<cmd>Lspsaga open_floaterm<CR>");
  tnoremap("<C-c>", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>");

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
    rename_action_quit = "<ESC>" -- 退出重命名
  }
end

--------------------------------------
-- dap 调试快捷键
--------------------------------------
keybindings.dapKeys = function()
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
