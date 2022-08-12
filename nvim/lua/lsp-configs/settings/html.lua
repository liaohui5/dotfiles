------------------------------------------------------------------------------------------------------
-- LSP html 配置
-- docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#htmlls
------------------------------------------------------------------------------------------------------
return {
	onstart = function(server, capabilities)
		server.setup({
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 150,
			},
			on_attach = function(client, bufnr)
				-- 禁止使用默认的格式化工具
				client.resolved_capabilities.document_formatting = false
				require("keybindings").lspKeys(client, bufnr)
			end,
		})
	end,
}
