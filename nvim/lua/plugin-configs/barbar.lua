----------------------------------------------------
-- 注释快捷键插件
-- docs: https://github.com/romgrk/barbar.nvim
----------------------------------------------------

return {
  onstart = function(barbar)
    -- offset with nvim-tree
    local nvim_tree_events = require('nvim-tree.events')
    local bufferline_state = require('bufferline.state')

    local function get_tree_size()
      return require'nvim-tree.view'.View.width
    end

    nvim_tree_events.subscribe('TreeOpen', function()
      bufferline_state.set_offset(get_tree_size())
    end)

    nvim_tree_events.subscribe('Resize', function()
      bufferline_state.set_offset(get_tree_size())
    end)

    nvim_tree_events.subscribe('TreeClose', function()
      bufferline_state.set_offset(0)
    end)

    barbar.setup({
      animation = true,
      auto_hide = false,
      tabpages = true,
      closable = true,
      clickable = false,
      exclude_ft = {},
      exclude_name = {},
      icons = true,
      icon_custom_colors = false,
      icon_separator_active = '▎',
      icon_separator_inactive = '▎',
      icon_close_tab = '',
      icon_close_tab_modified = '●',
      icon_pinned = '車',
      insert_at_end = false,
      insert_at_start = false,
      maximum_padding = 1,
      maximum_length = 30,
      semantic_letters = true,
      letters = 'asdfjklghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP12345',
      no_name_title = nil,
    })
  end
}
