-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  搜索文件/buffer/字符串                                                      │
-- │  docs: https://github.com/Shatur/neovim-session-manager                      │
-- │  依赖插件: https://github.com/nvim-lua/plenary.nvim                          │
-- │  同类插件: https://github.com/rmagatti/auto-session                          │
-- │  同类插件:  https://github.com/olimorris/persisted.nvim                      │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local session_manager = loadModule("session_manager", "plugin-configs")
local session_config  = loadModule("session_manager.config", "plugin-configs")
local Path            = loadModule("plenary.path", "plugin-configs")

-- 只有使用 neovide 的时候才加载 session, 否则不加载 session
local mode = session_config.AutoloadMode.Disabled;
if vim.g.isNeovide then
  mode = session_config.AutoloadMode.LastSession;
end

session_manager.setup({
  -- session 保存目录
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),

  -- 自动加载 session: Disabled(禁止) CurrentDir(当前目录) LastSession(上次session)
  -- autoload_mode              = session_config.AutoloadMode.LastSession,
  autoload_mode              = mode,
  path_replacer              = '__',
  colon_replacer             = '++',
  autosave_last_session      = true, -- 切换/退出之前自动保存当前 session 状态
  autosave_ignore_not_normal = true, -- 如果没有打开buffer或者所有buffer都是只读的就不保存session
  autosave_only_in_session   = true, -- 只有在 session 中, 自动保存 session
  max_path_length            = 80, -- 保存的 session 文件名最大长度
  autosave_ignore_filetypes  = {
    'gitcommit',
  },
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
