------------------------------------------------------------------------------------------------------
-- LSP css 配置
-- docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
------------------------------------------------------------------------------------------------------
return {
  onstart = function(server, capabilities)
    server.setup({
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        css = {
          validate = true,
        },
        less = {
          validate = true,
        },
        scss = {
          validate = true,
        },
      },
      on_attach = function(client, bufnr)
        -- 禁用格式化
				client.resolved_capabilities.document_formatting = false
        require("keybindings").lspKeys(client, bufnr)
      end,
    })
  end,
}
