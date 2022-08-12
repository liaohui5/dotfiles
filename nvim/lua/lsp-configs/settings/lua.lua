------------------------------------------------------------------------------------------------------
-- LSP lua 配置 
-- docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
-- lua-dev: https://github.com/folke/lua-dev.nvim
------------------------------------------------------------------------------------------------------
local status, lua_dev = pcall(require, "lua-dev")
if not status then
  vim.notify("[lsp]: lua-dev not found");
  return
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
  onstart = function(server)
    local opts = {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            -- Setup your lua path
            path = runtime_path,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
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
