---------------------------------------------------------------------------------------
-- js 调试配置
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript-firefox
---------------------------------------------------------------------------------------
return {
  onstart = function(dap, datapath, utils)
    local debugger_path = datapath .. "/mason/packages/vscode-firefox-debug/dist/adapter.bundle.js"
    dap.adapters.node2 = {
      type    = "executable",
      command = "node",
      args    = { debugger_path }
    }

    local languages = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" };
    for _, item in ipairs(languages) do
      dap.configurations[item] = {
        {
          name              = 'Debug with Firefox',
          type              = 'firefox',
          request           = 'launch',
          reAttach          = true,
          url               = 'http://localhost:3000',
          webRoot           = '${workspaceFolder}',
          firefoxExecutable = '/usr/bin/firefox'
        }
      }
    end
  end
}
