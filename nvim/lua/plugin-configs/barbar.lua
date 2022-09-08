-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ 注释快捷键插件                                                               │
-- │ docs: https://github.com/romgrk/barbar.nvim                                  │
-- ╰──────────────────────────────────────────────────────────────────────────────╯

local barbar = loadModule("bufferline", "plugins-config");
local events = loadModule('nvim-tree.events', 'plugin-configs');
local states = loadModule('bufferline.state', 'plugin-configs');
-- local nvimtree_view = loadModule('nvim-tree.view', 'plugin-configs');

-- 当侧边栏打设置 barbar 的左边边距
events.on_tree_open(function ()
  -- nvimtree_view.View.width not working
  -- local offsetWidth   = nvimtree_view.View.width + 1;
  local offsetWidth = 33;
  states.set_offset(offsetWidth, string.rep(" ", 10) .. 'File Explorer')
end);

-- 当侧边栏关闭时设置 barbar 的左边边距
events.on_tree_close(function ()
  states.set_offset(0)
end)

-- 当侧边栏删除文件时,自动跳到下一个buffer,否则 nvim-tree 的大小会改变
events.on_file_removed(function ()
  vim.cmd(":BufferNext")
end)

-- fixed error: Error executing lua callback: barbar.nvim/lua/bufferline/state.lua:784: bad argument #1 to 'table_insert' (table expected, got nil)
vim.g.session_save_commands = {};
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
