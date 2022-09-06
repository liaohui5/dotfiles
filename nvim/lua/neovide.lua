-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                              neovide 客户端配置                              │
-- │          docs: https://neovide.dev/configuration.html#configuration          │
-- │          github: https://github.com/neovide/neovide                          │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
vim.opt.guifont = { "Hack Nerd Font Mono", ":h16" };

local neovide_settings = {
  neovide_cursor_animation_length = 0, -- 禁用动画
}

for k, v in pairs(neovide_settings) do
  vim.g[k] = v
end

