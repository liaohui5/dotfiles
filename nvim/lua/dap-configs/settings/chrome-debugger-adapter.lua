
---------------------------------------------------------------------------------------
-- js 调试配置
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript-chrome
---------------------------------------------------------------------------------------

return {
  onstart = function(dap, datapath, utils)
    local debugger_path = datapath .. "/mason/packages/vscode-chrome-debug/out/src/chromeDebug.js"
    dap.adapters.chrome = {
      type    = "executable",
      command = "node",
      args    = { debugger_path }
    }

    local languages = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" };
    for _, item in ipairs(languages) do
      dap.configurations[item] = {
        {
          type       = "chrome",
          request    = "attach",
          program    = "${file}",
          cwd        = vim.fn.getcwd(),
          sourceMaps = true,
          protocol   = "inspector",
          port       = 9222,
          webRoot    = "${workspaceFolder}"
        }
      }
    end
  end
}
