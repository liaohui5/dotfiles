-----------------------------------------------------------
-- 切换命令行
-- docs: https://github.com/akinsho/toggleterm.nvim
-----------------------------------------------------------
local toggleterm = loadModule("toggleterm", "plugin-configs");

toggleterm.setup({
  -- on_open           = function() end
  -- on_close          = function() end
  -- on_stdout         = function() end
  -- on_stderr         = function() end
  -- on_exit           = function() end
  open_mapping      = require("keybindings").toggletermKeys(),
  shell             = vim.o.shell, -- 默认的 shell
  hide_numbers      = false,
  shade_terminals   = false,
  persist_size      = true,
  start_in_insert   = true,
  shading_factor    = 1, -- 打开终端的背景颜色(1:暗色 3:亮色)
  insert_mappings   = true, -- 插入模式是否应用快捷键
  terminal_mappings = true, -- 在终端中是否应用快捷键
  persist_mode      = true, -- 记住进入终端时vim的模式
  direction         = 'float', -- 终端打开方式 'vertical' | 'horizontal' | 'tab' | 'float',
  close_on_exit     = true, -- close the terminal window when the process exits
  auto_scroll       = true, -- automatically scroll to the bottom on terminal output
  shade_filetypes   = {},
  float_opts        = {
    border   = 'single', -- 浮动终端样式: 'single' | 'double' | 'shadow' | 'curved'
    width    = 150,
    height   = 38,
    winblend = 1,
  },
  -- 非浮动终端的大小
  size              = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
});
