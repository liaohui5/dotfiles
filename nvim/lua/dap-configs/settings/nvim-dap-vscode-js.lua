---------------------------------------------------------------------------------------
-- Node js 调试配置
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Javascript
-- https://github.com/mxsdev/nvim-dap-vscode-js
-- https://github.com/microsoft/vscode-js-debug
-- 目前只能调试 node(javascript/typescript) 无法调试 vue.js
---------------------------------------------------------------------------------------
local dap_vscode_js = loadModule("dap-vscode-js", "dap");

return {
  onstart = function(dap, datapath, utils)
    -- 注意这个路径: 必须是绝对路径才可以
    local debugger_path = datapath .. "/site/pack/packer/opt/vscode-js-debug"
    dap_vscode_js.setup({
      node_path = "node",
      debugger_path = debugger_path,
      adapters = {
        'pwa-node',
        'pwa-chrome',
        'pwa-msedge',
        'node-terminal',
        'pwa-extensionHost'
      },
    })

    -- 可以调试 js & ts
    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = {
        {
          type      = "pwa-node",
          request   = "launch",
          name      = "Launch file",
          program   = "${file}",
          cwd       = "${workspaceFolder}",
        },
        {
          type      = "pwa-node",
          request   = "attach",
          name      = "Attach",
          processId = utils.pick_process,
          cwd       = "${workspaceFolder}",
        }
      }
    end
  end
}
