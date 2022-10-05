------------------------------------------------------------------------------------------------------
-- LSP lua 配置
-- docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
-- lua-dev: https://github.com/folke/lua-dev.nvim
------------------------------------------------------------------------------------------------------
local lua_dev = loadModule("lua-dev", "lsp-configs");
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
  onstart = function(server)
    local opts = {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = runtime_path,
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        require("keybindings").lspKeys(client, bufnr);
      end,
    }

    local finalOpts = lua_dev.setup({ lspconfig = opts })
    server.setup(finalOpts)
  end,
}
