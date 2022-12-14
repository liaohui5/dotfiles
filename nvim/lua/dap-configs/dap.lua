-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  dap 调试插件                                                                │
-- │  https://github.com/mfussenegger/nvim-dap                                    │
-- │  https://github.com/mfussenegger/nvim-dap/wiki                               │
-- │  https://github.com/mxsdev/nvim-dap-vscode-js                                │
-- │  https://github.com/rcarriga/nvim-dap-ui                                     │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local dap = loadModule("dap", "dap");
local dapui = loadModule("dapui", "dap");

-- TODO: 自动安装对应的dap-server, 需要mason-installer-tools
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim

-- 配置断点图标
local function set_breakpoint_icon()
  local breakpoint = {
    error = {
      text = "🔴",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "❌",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "🟡",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", breakpoint.error)
  vim.fn.sign_define("DapStopped", breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", breakpoint.rejected)
end

-- 配置断点UI
local function config_dapui()
  -- 开启 dapUI 界面
  local debug_open = function()
    dapui.open()
    vim.api.nvim_command("DapVirtualTextEnable")
  end

  -- 关闭 dapUI 界面
  local debug_close = function()
    dap.repl.close()
    dapui.close()
    vim.api.nvim_command("DapVirtualTextDisable")
    -- vim.api.nvim_command("bdelete! term:")   -- close debug temrinal
  end

  dap.listeners.after.event_initialized["dapui_config"] = debug_open
  dap.listeners.before.event_terminated["dapui_config"] = debug_close
  dap.listeners.before.event_exited["dapui_config"]     = debug_close
  dap.listeners.before.disconnect["dapui_config"]       = debug_close
end

-- 配置不同语言的 debugger
local function config_debuggers()
  dap.defaults.fallback.terminal_win_cmd = '30vsplit new'
  dap.set_log_level("DEBUG")
  -- 加载对应语言的debugger配置
  local utils             = require("dap.utils")
  local datapath          = vim.fn.stdpath("data")
  -- TODO: 现在只能调试node, 无法调试vue/react项目
  -- TODO: 参考配置: https://github.com/ecosse3/nvim/blob/master/lua/plugins/dap.lua#L132
  local debugger_adapters = {
    "nvim-dap-vscode-js",
    -- "node-debug2-adapter",
    -- "chrome-debugger-adapter",
    -- "firefox-debbugger-adapter",
  };

  for _, item in pairs(debugger_adapters) do
    local adapter_path = "dap-configs.settings." .. item;
    local ok2, adapter = pcall(require, adapter_path);
    if not ok2 then
      vim.notify("[dap] not found adapter " .. adapter_path);
      return;
    end
    -- 必须实现 onstart 方法
    adapter.onstart(dap, datapath, utils);
  end
end

return {
  onstart = function()
    set_breakpoint_icon()
    config_dapui()
    config_debuggers()
  end
}
