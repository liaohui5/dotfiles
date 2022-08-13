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
--------------------------------------
keybindings.cmpKeys = function(cmp, luasnip, cmp_config)
  -- 载入工具模块
  local cmpUtils = require("utils.cmp")
  local check_backspace = cmpUtils.check_backspace
  local jumpable = cmpUtils.jumpable
  local is_emmet_active = cmpUtils.is_emmet_active
  return {
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- 上一项
    ["<C-j>"] = cmp.mapping.select_next_item(), -- 下一项

    ["<C-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- 显示代码提示
    ["<C-e>"] = cmp.mapping({ -- 关闭提示
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),

    -- 如果窗口内容太多，可以上下滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

    -- snippets 上一个位置
    ["<C-h>"] = cmp.mapping(function(fallback)
      if jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end),

    -- snippets 下一个位置
    ["<C-l>"] = cmp.mapping(function(fallback)
      if jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end),

    -- Tab: 下一个
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif check_backspace() then
        fallback()
      elseif is_emmet_active() then
        return vim.fn["cmp#complete"]()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- shift-tab: 上一个
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- 确定选中提示
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm(cmp_config.confirm_opts)
      else
        fallback()
      end
    end),
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
    -- ["replace_cmd"] = {
    --   map = "<leader>rC",
    --   cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
    --   desc = "input replace vim command",
    -- },
  }
end

--------------------------------------
-- nvimtree 侧边栏目录树快捷键
--------------------------------------
keybindings.nvimtreeKeys = function()
  -- Ctrl + t: 切换显示/隐藏
  nnoremap("<C-t>", ":NvimTreeToggle<CR>")

  return {
    { key = "o", action = "edit" },                -- 打开并编辑
    { key = "<CR>", action = "edit" },             -- 打开并编辑
    { key = "<C-\\>", action = "system_open" },    -- 用系统 open 命令打开
    { key = "v", action = "vsplit" },              -- 左右拆分窗口并打开编辑
    { key = "i", action = "toggle_ignored" },      -- 切换忽略
    { key = ".", action = "toggle_dotfiles" },     -- 切换隐藏文件是否可见
    { key = "R", action = "refresh" },             -- 刷新
    { key = "a", action = "create" },              -- 创建文件/目录(/结尾就是目录)
    { key = "r", action = "rename" },              -- 重命名
    { key = "x", action = "remove" },              -- 删除
    { key = "d", action = "cut" },                 -- 剪切
    { key = "y", action = "copy" },                -- 复制
    { key = "p", action = "paste" },               -- 粘贴
    { key = "Yn", action = "copy_name" },          -- 复制文件名
    { key = "Yp", action = "copy_path" },          -- 否则文件路径
    { key = "YP", action = "copy_absolute_path" }, -- 复制文件绝对路径
    { key = "I", action = "toggle_file_info" },    -- 查看文件信息
    { key = { "]" }, action = "cd" },              -- 切换目录
    { key = { "[" }, action = "dir_up" },          -- 切换到上级目录
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
  vim.cmd[[
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
keybindings.projectsKeys = function ()
  -- 因为功能和 sessionManager 非常相似,
  -- 二者开启一个就好了, 所以用一样快捷键
  nnoremap("<leader>pm", ":Telescope projects<CR>");
end

--------------------------------------
-- telescope 搜索文件快捷键
--------------------------------------
keybindings.telescopeKeys = function()
  nnoremap("<C-p>", "<cmd>Telescope find_files prompt_prefix=[files]<CR>")
  nnoremap("<leader>fb", "<cmd>Telescope buffers prompt_prefix=[buffers]<CR>")
  nnoremap("<leader>fs", "<cmd>Telescope live_grep prompt_prefix=[string]<CR>")
  nnoremap("<leader>fh", "<cmd>Telescope help_tags prompt_prefix=[telescope help tags]<CR>")

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

  -- code action, 改用 lsp-saga 的方法
  -- bufkeyset(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)

  -- 查看代码定义的位置
  bufkeyset(bufnr, "n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", opt)

  -- 显示帮助, 改用 lsp-saga 的方法
  -- bufkeyset(bufnr, "n", "<C-h>", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)

  -- 显示参数提示
  -- bufkeyset(bufnr, "n", "gf", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt);
end

--------------------------------------
-- typescript 插件快捷键设置
--------------------------------------
keybindings.typescriptKeys = function(actions) end

--------------------------------------
-- lsp-ui 自定义插件快捷键设置
--------------------------------------
keybindings.lspUIKeys = function()
  -- or use command
  local keyset = vim.keymap.set;
  local opts = { silent = true, noremap = true };

  -- 变量重命名
  keyset("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

  -- 查看帮助文档
  keyset("n", "<C-h>", "<cmd>Lspsaga hover_doc<CR>", opts)

  -- 查看文件定义
  keyset("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)

  -- 代码修复,小灯泡 code action
  keyset("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keyset("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)

  -- 参数提示
  keyset("n", "gr", "<cmd>Lspsaga rename<CR>", opts)

  -- 参看函数定义
  keyset("n", "go", "<cmd>Lspsaga preview_definition<CR>", opts)
  keyset("n", "gl", "<cmd>Lspsaga lsp_finder<CR>", opts)

  -- 跳到上/下/错误一个代码诊断提示位置
  keyset("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keyset("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

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
    }
  }
end



return keybindings
