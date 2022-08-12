------------------------------------------------------------------------------------------------------
-- LSP json 配置
-- docs: 
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
-- https://github.com/b0o/schemastore.nvim 
------------------------------------------------------------------------------------------------------
local status, schemastore = pcall(require, "schemastore")
if not status then
	vim.notify("[lsp]: schemastore not found")
	return
end

return {
	onstart = function(server, capabilities)
		server.setup({
			capabilities = capabilities,
			setttings = {
				json = {
					schemas = schemastore.json.schemas(),
				},
        validate = {
          enable = false,
        },
			},
			flags = {
				debounce_text_changes = 150,
			},
			on_attach = function(client, bufnr)
				-- 禁止使用默认的格式化工具
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_highlight  = false
				require("keybindings").lspKeys(client, bufnr)
			end,
		})
	end,
}
