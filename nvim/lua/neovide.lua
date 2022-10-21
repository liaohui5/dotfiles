-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ neovide 客户端配置                                                           │
-- │ docs: https://neovide.dev/configuration.html#configuration                   │
-- │ github: https://github.com/neovide/neovide                                   │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
-- 设置 neovide 选项
local neovide_settings = {
  -- neovide_cursor_vfx_mode         = "",    -- ""取消光标动画效果
  -- neovide_transparency            = 0.5,   -- 透明度
  neovide_cursor_animation_length = 0,     -- 0禁用动画
  neovide_fullscreen              = false, -- 全屏打开
  neovide_remember_window_size    = true,  -- 记住之前的大小
  neovide_input_macos_alt_is_meta = true,  -- 将 meta 映射到 alt
  neovide_input_use_logo          = true,  -- macos only
}

for k, v in pairs(neovide_settings) do
  vim.g[k] = v
end

-- 设置字体
local setFontSize = function (font_family, font_size)
  vim.opt.guifont = string.format("%s:h%s", font_family, font_size or "14")
end
setFontSize("JetBrainsMonoNL Nerd Font Mono", 15)

-- 设置快捷键
local keyset = vim.api.nvim_set_keymap;
local options = { noremap = true, silent = true };
keyset('', '<D-v>', '+p<CR>',  options);
keyset('!', '<D-v>', '<C-R>+', options);
keyset('t', '<D-v>', '<C-R>+', options);
keyset('v', '<D-v>', '<C-R>+', options);
keyset('c', '<D-v>', '<C-R>+', options);
