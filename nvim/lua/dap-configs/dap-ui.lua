-----------------------------------------------------------------
-- dap 调试插件UI扩展
-- docs: https://github.com/rcarriga/nvim-dap-ui
-----------------------------------------------------------------
local dapui = loadModule("dapui", "dap");

return {
  onstart = function()
    local dapUIKeys = require("keybindings").dapUIKeys();
    dapui.setup({
      mappings     = dapUIKeys.mappings,
      expand_lines = vim.fn.has("nvim-0.7"),
      icons = {
        expanded   = "",
        collapsed  = ""
      },
      layouts = {
        {
          -- 执行上下文/断点/堆栈信息/watch的变量
          position = "left",
          size     = 30, -- 30% 宽度
          elements = {
            { id = "scopes", size = 0.25 },
            "breakpoints",
            "stacks",
            "watches",
          },
        },
        {
          -- 控制台
          elements = { "repl", "console" },
          position = "bottom",
          size     = 0.3, -- 25% 高度
        },
      },
      floating = {
        max_height = nil,      -- 最大高度0.1 - 1(0.1到1之间的数)
        max_width  = nil,      -- 最大宽度0.1 - 1(0.1到1之间的数)
        border     = "single", -- 边框: "single", "double" or "rounded"
        mappings   = dapUIKeys.floatingMappings,
      },
    })

  end
}
