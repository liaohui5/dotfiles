-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  搜索文件/buffer/字符串                                                      │
-- │  docs: https://github.com/Shatur/neovim-session-manager                      │
-- │  依赖插件: https://github.com/nvim-lua/plenary.nvim                          │
-- │  同类插件: https://github.com/charludo/projectmgr.nvim                       │
-- │  同类插件: https://github.com/rmagatti/auto-session                          │
-- │  同类插件:  https://github.com/olimorris/persisted.nvim                      │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local session_manager = loadModule("session_manager", "plugin-configs")
local Path = loadModule("plenary.path", "plugin-configs")

session_manager.setup({
  -- session 保存目录
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),

  -- 以什么方式加载 session: Disabled, CurrentDir, LastSession
  -- autoload_mode              = require('session_manager.config').AutoloadMode.Disabled,
  autoload_mode              = require('session_manager.config').AutoloadMode.CurrentDir,
  path_replacer              = '__',
  colon_replacer             = '++',
  autosave_last_session      = true, -- 是否自动保存session
  autosave_ignore_not_normal = true, -- 如果没有打开buffer或者所有buffer都是只读的就不保存session
  autosave_ignore_filetypes  = { 'gitcommit' },
  autosave_only_in_session   = true, -- 自动保存当前 session 状态
  max_path_length            = 80, -- 保存的 session 文件名最大长度
})

-- 加载session时自动打开目录树
-- vim.cmd[[
--   augroup open_nvim_tree_group
--     autocmd! * <buffer>
--     autocmd SessionLoadPost * silent! :lua require("nvim-tree").toggle(false, true)
--   augroup end
--]]

-- 绑定快捷键
require("keybindings").sessionManagerKeys();
