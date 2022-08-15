----------------------------------------------------
-- 自动保存文件
-- docs: https://github.com/Pocco81/auto-save.nvim
----------------------------------------------------
return {
  onstart = function(autosave)
    autosave.setup({
      enabled           = true,
      trigger_events    = { "InsertLeave" },
      write_all_buffers = false,
      debounce_delay    = 500,
      execution_message = {
        dim               = 0.18,
        cleaning_interval = 1250,
        message           = function()
          return ("auto-save: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
      },
      condition         = function(buf)
        local disabled_buffers = {
          "NvimTree",
          "TelescopePrompt",
          "aerial",
          "spectre_panel"
        };
        local fn    = vim.fn
        local utils = require("auto-save.utils.data")
        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), disabled_buffers) then
          return true
        end
        return false
      end,
      callbacks         = {
        enabling              = nil,
        disabling             = nil,
        before_saving         = nil,
        after_saving          = nil,
        before_asserting_save = nil,
      }
    })
  end
}
