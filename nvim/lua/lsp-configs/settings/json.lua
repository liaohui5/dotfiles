------------------------------------------------------------------------------------------------------
-- LSP json 配置
-- docs: 
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
-- https://github.com/b0o/schemastore.nvim 
------------------------------------------------------------------------------------------------------
return {
	onstart = function(server, capabilities)
		server.setup({
			capabilities = capabilities,
			setttings = {
        validate = {
          enable = false,
        },
			},
			flags = {
				debounce_text_changes = 150,
			},
			on_attach = function(client, bufnr)
				-- 禁止使用默认的格式化工具
				client.server_capabilities.document_formatting = false
				client.server_capabilities.document_highlight  = false
				require("keybindings").lspKeys(client, bufnr)
			end,
		})
	end,
}
