----------------------------------------------------
-- 顶部标签页
-- docs: https://github.com/akinsho/bufferline.nvim
----------------------------------------------------

return {
  onstart = function(bufferline)
    bufferline.setup({
      options = {
        mode                     = "buffers", -- buffers | tabs
        themable                 = false,
        numbers                  = "none", -- "none" | "ordinal" | "buffer_id" | "both"
        mappings                 = false, -- 不要绑定快捷键
        show_buffer_icons        = true,
        show_buffer_close_icons  = false,
        show_buffer_default_icon = true,
        show_close_icon          = false,
        show_tab_indicators      = false,
        persist_buffer_sort      = true,
        separator_style          = "slant", -- "slant" | "thick" | "padded_slant" | "thick" | "thin"
        enforce_regular_tabs     = false,
        always_show_bufferline   = true,
        sort_by                  = "insert_after_current", -- insert_after_current |insert_at_end | id | extension
        name_formatter           = function(buf)
          if buf.name:match('%.md') then
            return vim.fn.fnamemodify(buf.name, ':t:r')
          end
        end,
        offsets                  = {
          {
            filetype   = "NvimTree",
            text       = "File Explorer",
            highlight  = "Directory",
            text_align = "center"
          }
        },
      }
    });
    -- 绑定快捷键
    require("keybindings").bufferlineKeys();
  end
}
