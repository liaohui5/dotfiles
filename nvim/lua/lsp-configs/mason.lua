---------------------------------------------------------------------
-- 安装LSP服务器工具
-- docs:
-- https://github.com/williamboman/mason.nvim
---------------------------------------------------------------------
local mason = loadModule("mason", "lsp");

return {
	onstart = function()
		mason.setup({
			keymaps = require("keybindings").lspMasonKeys,
      max_concurrent_installers = 10,
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}
