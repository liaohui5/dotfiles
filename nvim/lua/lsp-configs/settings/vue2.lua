------------------------------------------------------------------------------------------------------
-- LSP vue2 配置
-- docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vuels
------------------------------------------------------------------------------------------------------
return {
	onstart = function(server, capabilities)
    server.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				-- 禁用格式化
				client.server_capabilities.document_formatting = false
				require("keybindings").lspKeys(client, bufnr)
			end,
    });
  end
}
