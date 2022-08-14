-----------------------------------------------------------
-- 搜索文件/buffer/字符串
-- docs: https://github.com/Shatur/neovim-session-manager
-- 依赖插件: https://github.com/nvim-lua/plenary.nvim
-- 同类插件: https://github.com/charludo/projectmgr.nvim
-----------------------------------------------------------
local config = {};

config.onstart = function(sessionMgr)
  local Path = require('plenary.path')
  sessionMgr.setup({
    -- session 保存目录
    sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),

    -- 以什么方式保存 session, allowed values: Disabled, CurrentDir, LastSession
    autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
    path_replacer              = '__',
    colon_replacer             = '++',
    autosave_last_session      = false, -- 是否自动保存session
    autosave_ignore_not_normal = true,  -- 如果没有打开buffer或者所有buffer都是只读的就不保存session
    autosave_ignore_filetypes  = {
      'gitcommit',
    },
    autosave_only_in_session = true, -- 自动保存当前 session 状态
    max_path_length          = 80,   -- 保存的 session 文件名最大长度
  })

  -- 加载session时自动打开目录树
  -- vim.cmd[[
  --   augroup _open_nvim_tree
  --     autocnd! * <buffer>
  --     autocmd SessionLoadPost * silent! Lua require ("nvim-tree"). toggle(false, true)
  --   augroup end
  -- ]]

  -- 加载session时自动打开目录树, 现在改用rnvimr, 所以禁用
  -- vim.api.nvim_create_autocmd({ 'SessionLoadPost' }, {
  --   group = vim.api.nvim_create_augroup('SessionMgrConfig', {}),
  --   callback = function()
  --     require("nvim-tree").toggle(false, true)
  --   end,
  -- })

  -- 绑定快捷键
  require("keybindings").sessionManagerKeys();
end


return config;
