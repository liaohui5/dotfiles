----------------------------------------------------
-- 顶部标签页
-- docs: https://github.com/akinsho/bufferline.nvim
----------------------------------------------------

return {
  onstart = function(bufferline)
    bufferline.setup({
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_buffer_default_icon = true,
        show_close_icon = false,
        show_tab_indicators = false,
        persist_buffer_sort = true,
        separator_style = "thick", -- "slant" | "thick" | "thin" ,
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        sort_by = 'insert_at_end', -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = false,
        name_formatter = function(buf)
          if buf.name:match('%.md') then
            return vim.fn.fnamemodify(buf.name, ':t:r')
          end
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer"
          }
        },
      }
    });

    -- 绑定快捷键
    require("keybindings").bufferlineKeys();
  end
}
