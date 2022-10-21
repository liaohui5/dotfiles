------------------------------------------------------------------------------------------------------
-- LSP vue 配置
-- docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
------------------------------------------------------------------------------------------------------
return {
	onstart = function(server, capabilities)
		server.setup({
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 150,
			},
			init_options = {
				documentFeatures = {
					documentColor = false,
					documentFormatting = {
						defaultPrintWidth = 150, -- 格式化时每行最大宽度
					},
					documentSymbol = true,
					foldingRange = true,
					linkedEditingRange = true,
					selectionRange = true,
				},
				languageFeatures = {
					callHierarchy = true,
					codeAction = true,
					codeLens = false,
					completion = {
						defaultAttrNameCase = "kebabCase",
						defaultTagNameCase = "both",
					},
					definition = true,
					diagnostics = true,
					documentHighlight = true,
					documentLink = true,
					hover = true,
					implementation = true,
					references = true,
					rename = true,
					renameFileRefactoring = true,
					schemaRequestService = true,
					semanticTokens = false,
					signatureHelp = true,
					typeDefinition = true,
				},
			},
			on_attach = function(client, bufnr)
				-- 禁用格式化
				client.server_capabilities.document_formatting = false
				require("keybindings").lspKeys(client, bufnr)
			end,
		});
	end,
}
