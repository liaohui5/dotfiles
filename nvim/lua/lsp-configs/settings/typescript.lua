------------------------------------------------------------------------------------------------------
-- LSP lua 配置
-- docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
-- typescript-language-server: https://github.com/typescript-language-server/typescript-language-server
------------------------------------------------------------------------------------------------------
return {
  onstart = function(server, capabilities)
    server.setup({
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      init_options = {
        preferences = {
          includeInlayParameterNameHints = "none", -- "none" | "literals" | "all";
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayEnumMemberValueHints = false,
        },
      },
      on_attach = function(client, bufnr)
        -- 禁止使用默认的格式化工具
        client.resolved_capabilities.document_formatting = false
        require("keybindings").lspKeys(client, bufnr)
      end,
    })
  end,
}
