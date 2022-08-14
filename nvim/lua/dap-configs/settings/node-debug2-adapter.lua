---------------------------------------------------------------------------------------
-- js 调试配置
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript
---------------------------------------------------------------------------------------
return {
  onstart = function(dap, datapath, utils)
    local debugger_path = datapath .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js"
    dap.adapters.node2 = {
      type    = "executable",
      command = "node",
      args    = { debugger_path }
    }

    local languages = { "typescript", "javascript" };
    for _, item in ipairs(languages) do
      dap.configurations[item] = {
        {
          type       = "node2",
          request    = "launch",
          name       = "Launch file",
          program    = "${file}",
          cmd        = vim.fn.getcwd(),
          sourceMaps = true,
          protocol   = 'inspector',
          console    = 'integratedTerminal',
        },
        {
          type       = "node2",
          request    = "attach",
          name       = "Attach",
          processId  = utils.pick_process,
          cwd        = "${workspaceFolder}",
        }
      }
    end
  end
}
