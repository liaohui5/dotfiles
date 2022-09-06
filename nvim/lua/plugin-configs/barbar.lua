-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                注释快捷键插件                                │
-- │                 docs: https://github.com/romgrk/barbar.nvim                  │
-- ╰──────────────────────────────────────────────────────────────────────────────╯

local barbar           = loadModule("bufferline", "plugins-config");
local nvim_tree_events = loadModule('nvim-tree.events', 'plugin-configs');
local bufferline_state = loadModule('bufferline.state', 'plugin-configs');

-- nvim_view.View.width was not working
-- local offsetWidth = nvimtree_view.View.width + 1;
-- local nvimtree_view = loadModule('nvim-tree.view', 'plugin-configs');

local offsetWidth = 33;
nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_state.set_offset(offsetWidth)
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_state.set_offset(0)
end)

-- nvim_tree_events.subscribe('Resize', function()
--   bufferline_state.set_offset(offsetWidth)
-- end)


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
  insert_at_end           = false,
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
