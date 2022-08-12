------------------------------------------------------------------------------------------------------
-- LSP emmet 配置
-- docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#emmet_ls
------------------------------------------------------------------------------------------------------

return {
  onstart = function(server, capabilities)
    server.setup({
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
      init_options = {
        html = {
          options = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            ["bem.enabled"] = true,
            ["jex.enabled"] = true,
          },
        },
      },
      on_attach = function(client, bufnr)
        -- 禁止使用默认的格式化工具
        client.resolved_capabilities.document_formatting = false

        -- 让 nvim-cmp 显示补全
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        require("keybindings").lspKeys(client, bufnr)
      end,
    })
  end,
}
