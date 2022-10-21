-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ 注释快捷键插件                                                               │
-- │ docs: https://github.com/romgrk/barbar.nvim                                  │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local barbar = loadModule("bufferline", "plugins-config");
local barApi = loadModule("bufferline.api", "plugin-configs");

-- 当侧边栏打开时, 设置 barbar 的左边边距
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "NvimTree" then
      local offsetWidth = 33;
      barApi.set_offset(offsetWidth, string.rep(" ", 10) .. "File Explorer");
    end
  end
});

-- 当侧边栏关闭时设置 barbar 的左边边距
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    if vim.fn.expand("<afile>"):match("NvimTree") then
      barApi.set_offset(0);
    end
  end
});

barbar.setup({
  exclude_ft              = {},
  exclude_name            = {},
  animation               = false,
  auto_hide               = false,
  tabpages                = false,
  closable                = true,
  clickable               = false,
  icons                   = true,
  icon_custom_colors      = false,
  insert_at_end           = true,
  insert_at_start         = false,
  maximum_padding         = 2,
  maximum_length          = 30,
  semantic_letters        = true,
  no_name_title           = nil,
  letters                 = 'asdfjklghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP12345',
  icon_separator_active   = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab          = '',
  icon_close_tab_modified = '●',
  icon_pinned             = '車',
})

require("keybindings").barbarKeys();
