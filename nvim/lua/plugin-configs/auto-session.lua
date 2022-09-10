-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ session 管理, 功能类似 vscode 的 project manager 插件                        │
-- │ https://github.com/rmagatti/auto-session                                     │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local autoSession = loadModule("auto-session","plugin-configs");
local nvimTree    = loadModule("nvim-tree", "plugin-configs");


-- session 加载后, 自动打开 NvimTree
local restoreNvimTree = function ()
  nvimTree.change_dir(vim.fn.getcwd());
  nvimTree.refresh();
end

vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal";
autoSession.setup({
  auto_restore_enabled             = true,  -- 自动恢复 session
  auto_session_enable_last_session = true,  -- 自动加载上次关闭最后一个 session
  auto_session_create_enabled      = false, -- 自动创建 session
  auto_save_enabled                = true,  -- 自动保存 session
  postrestore_cmds                 = {      -- 在加载session之后还原 nvimtree 的状态
    restoreNvimTree,
  },
})

require("keybindings").autoSessionKeys();

