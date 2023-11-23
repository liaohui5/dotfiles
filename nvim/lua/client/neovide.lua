-- stylua: ignore start
----------------------------------------------------------------------------------
-- neovide 客户端配置
-- https://github.com/neovide/neovide
-- https://neovide.dev/configuration.html#configuration
----------------------------------------------------------------------------------
-- 设置全局选项
----------------------------------------------------------------------------------
-- vim.g.neovide_cursor_vfx_mode         = ""    -- 取消光标动画效果
-- vim.g.neovide_transparency            = 0.8   -- 透明度
vim.g.neovide_cursor_animation_length = 0     -- 0禁用动画
vim.g.neovide_fullscreen              = false -- 全屏打开
vim.g.neovide_remember_window_size    = true  -- 记住之前的大小
vim.g.neovide_input_macos_alt_is_meta = true  -- 将 meta 映射到 alt
vim.g.neovide_input_use_logo          = true  -- macos only
vim.g.neovide_profiler                = false

----------------------------------------------------------------------------------
-- 设置字体
-- https://neovide.dev/configuration.html#font
----------------------------------------------------------------------------------
vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h16:#e-subpixelantialias:#h-sLight"

----------------------------------------------------------------------------------
-- 绑定 neovide 快捷键
----------------------------------------------------------------------------------
local keymap = vim.api.nvim_set_keymap
local option = { noremap = true, silent = true }
keymap("v", "<D-c>", '"+y', option)       -- Copy
keymap("n", "<D-v>", '"+P', option)       -- Paste normal mode
keymap("v", "<D-v>", '"+P', option)       -- Paste visual mode
keymap("c", "<D-v>", "<c-R>+", option)    -- Paste command mode
keymap("i", "<D-v>", '<ESC>"+PA', option) -- Paste insert mode
