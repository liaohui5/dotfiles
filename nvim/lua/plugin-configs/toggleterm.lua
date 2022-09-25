-- ╭───────────────────────────────────────────────────────────────────────────────────╮
-- │  切换命令行                                                                       │
-- │  docs: https://github.com/akinsho/toggleterm.nvim                                 │
-- ╰───────────────────────────────────────────────────────────────────────────────────╯
-- ╭──────────────────────────────────────────────────────────────────────────────────╮
-- │ Terminal API                                                                     │
-- │ https://github.com/akinsho/toggleterm.nvim/blob/main/lua/toggleterm/terminal.lua │
-- ╰──────────────────────────────────────────────────────────────────────────────────╯
-- new      : 创建新的 terminal 实例
-- toggle   : 切换 terminal 实例显示/隐藏
-- is_open  : 获取 terminal 实例是否显示
-- open     : 显示 terminal 实例
-- close    : 隐藏 terminal 实例
-- shutdown : 退出(Ctrl+d) terminal 实例进程
local toggleterm = loadModule("toggleterm", "plugin-configs");
local terminal   = loadModule("toggleterm.terminal", "plugin-configs");
local Terminal   = terminal.Terminal;
local plugins    = {};
local float_opts = {
  border   = "single", -- 浮动终端样式: single | double | shadow | curved
  width    = 150,
  height   = 38,
  winblend = 1,
};

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  集成 lazygit                                                                │
-- │  https://github.com/jesseduffield/lazygit                                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
plugins.lazygit = Terminal:new({
  cmd        = "lazygit",
  hidden     = true,
  direction  = "float",
  float_opts = float_opts,
});

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  集成 vifm                                                                   │
-- │  https://github.com/vifm/vifm                                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
plugins.vifm = Terminal:new({
  cmd        = "vifm . ~",
  hidden     = true,
  direction  = "float",
  float_opts = float_opts,
});

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ 集成zellij                                                                   │
-- │ https://github.com/zellij-org/zellij                                         │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
plugins.zellij = Terminal:new({
  cmd        = "zellij",
  hidden     = true,
  direction  = "float",
  float_opts = float_opts,
});

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ 集成 tmux                                                                    │
-- │ https://github.com/tmux/tmux                                                 │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
plugins.tmux = Terminal:new({
  cmd        = "tmux",
  hidden     = true,
  direction  = "float",
  float_opts = float_opts,
});

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ 快捷键                                                                       │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local keys = require("keybindings").toggletermKeys(plugins);

toggleterm.setup({
  -- on_open           = function() end
  -- on_close          = function() end
  -- on_stdout         = function() end
  -- on_stderr         = function() end
  -- on_exit           = function() end
  open_mapping      = keys,
  shell             = vim.o.shell, -- 默认的 shell
  hide_numbers      = true, -- 打开的终端中是否要显示行号
  shade_terminals   = false,
  persist_size      = true,
  start_in_insert   = true,
  shading_factor    = 1, -- 打开终端的背景颜色(1:暗色 3:亮色)
  insert_mappings   = true, -- 插入模式是否应用快捷键
  terminal_mappings = true, -- 在终端中是否应用快捷键
  persist_mode      = true, -- 记住进入终端时vim的模式
  direction         = "horizontal", -- 终端打开方式 vertical | horizontal | tab | float
  close_on_exit     = true, -- close the terminal window when the process exits
  auto_scroll       = true, -- automatically scroll to the bottom on terminal output
  shade_filetypes   = {},
  size              = function(term) -- 非浮动终端的大小
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
});
