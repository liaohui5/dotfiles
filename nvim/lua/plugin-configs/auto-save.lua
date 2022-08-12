----------------------------------------------------
-- 自动保存文件
-- docs: https://github.com/Pocco81/auto-save.nvim
----------------------------------------------------
return {
  onstart = function(autosave)
    autosave.setup({
      enabled = true,
      execution_message = {
        message = function()
          return ("auto-save: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { "InsertLeave" },
      condition = function(buf)
        local fn    = vim.fn
        local utils = require("auto-save.utils.data")
        if fn.getbufvar(buf, "&modifiable") == 1 and
            utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
          return true
        end
        return false
      end,
      write_all_buffers = false,
      debounce_delay    = 500,
      callbacks = {
        enabling              = nil,
        disabling             = nil,
        before_saving         = nil,
        after_saving          = nil,
        before_asserting_save = nil,
      }
    })
  end
}
