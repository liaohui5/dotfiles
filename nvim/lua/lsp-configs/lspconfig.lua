---------------------------------------------------------------------
-- 配置LSP服务器工具
-- docs:
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason-lspconfig.nvim
---------------------------------------------------------------------
local lspconfig       = loadModule("lspconfig", "lsp");
local mason_lspconfig = loadModule("mason-lspconfig", "lsp");
local cmp_nvim_lsp    = loadModule("cmp_nvim_lsp", "lsp");

return {
	onstart = function()
    -- 先启动 mason-lspconfig 确保LSP服务器安装好了
    mason_lspconfig.setup({
      automatic_installation = true, -- 自动安装LSP服务器
      ensure_installed       = {     -- 要安装的LSP服务器: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
        "sumneko_lua",
        "tsserver",
        "yamlls",
        "bashls",
        "cssls",
        "html",
        "jsonls",
        "volar",
        "emmet_ls",
        "tailwindcss",
        "vimls"
      }
    })

		-- server_name = 配置文件名
		-- server_name 必须是允许的: https://github.com/williamboman/mason-lspconfig.nvim#default-configuration
		-- 配置文件路径: 如 typescript 在 /lua/lsp-configs/settings/typescript.lua
		local settings  = {
			sumneko_lua   = "lua",
			tsserver      = "typescript",
			yamlls        = "yaml",
			bashls        = "bash",
			cssls         = "css",
			html          = "html",
			jsonls        = "json",
			volar         = "vue",
			emmet_ls      = "emmet",
			-- 使用默认配置
			-- tailwindcss = "tailwindcss"
		}

		for server_name, config in pairs(settings) do
			local server = lspconfig[server_name]
			if config ~= nil then
				-- 使用自定义配置启动LSP server, 必须实现 onstart 方法
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
				require("lsp-configs.settings." .. config).onstart(server, capabilities)
			else
				-- 使用默认参数
				server.setup({})
			end
		end
	end,
}
