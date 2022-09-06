-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                              neovide 客户端配置                              │
-- │          docs: https://neovide.dev/configuration.html#configuration          │
-- │          github: https://github.com/neovide/neovide                          │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.opt.guifont = { "Hack Nerd Font Mono", ":h16" };

local neovide_settings = {
  neovide_cursor_animation_length = 0,     -- 禁用动画
  neovide_fullscreen              = false, -- 全屏打开
  neovide_remember_window_size    = true,  -- 记住之前的大小
  neovide_input_macos_alt_is_meta = true,  -- 将 meta 映射到 alt
  neovide_cursor_vfx_mode         = "",    -- 取消光标动画效果
}

for k, v in pairs(neovide_settings) do
  vim.g[k] = v
end

