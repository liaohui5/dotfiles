-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  安装LSP服务器工具                                                           │
-- │  docs: https://github.com/williamboman/mason.nvim                            │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local mason = loadModule("mason", "lsp");

return {
	onstart = function()
    local keymaps = require("keybindings").lspMasonKeys();
		mason.setup({
			keymaps = keymaps,
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
