---------------------------------------------------------------------
-- 给 nvim-cmp 提供 lsp 的代码提示
-- docs:
-- https://github.com/williamboman/nvim-lsp-installer
-- https://github.com/neovim/nvim-lspconfig
---------------------------------------------------------------------
local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("[lsp]: lspconfig not found");
  return
end
local status1, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status1 then
  vim.notify("[lsp] lsp_installer not found!")
  return
end

local status2, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status2 then
  vim.notify("[lsp] cmp_nvim_lsp not found!")
  return
end

-- 启动 lspinstaller
-- https://github.com/williamboman/nvim-lsp-installer#default-configuration
lsp_installer.setup({
  -- 自动安装lsp server
  automatic_installation = true,

  -- 确保安装的server, 必须是允许的
  ensure_installed = {
    'bashls',
    'html',
    'cssls',
    'emmet_ls',
    'jsonls',
    'sumneko_lua',
    'volar',
    'yamlls',
    'tsserver'
  },
});

-- server_name = 配置文件名
-- server_name 必须是允许的: https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- 配置文件路径: 如 typescript 在 /lua/lsp-configs/settings/typescript.lua
local settings = {
  sumneko_lua  = "lua",
  tsserver     = "typescript",
  yamlls       = "yaml",
  bashls       = "bash",
  cssls        = "css",
  html         = "html",
  jsonls       = "json",
  volar        = "vue",
  emmet_ls     = "emmet",
  -- 使用默认配置
  -- tailwindcss = "tailwindcss"
}

for server_name, config in pairs(settings) do
  local server = lspconfig[server_name]
  if config ~= nil then
    -- 使用自定义配置启动LSP server, 必须实现 onstart 方法
    local capabilities = vim.lsp.protocol.make_client_capabilities();
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities);
    require("lsp-configs.settings." .. config).onstart(server, capabilities);
  else
    -- 使用默认参数
    server.setup({})
  end
end

-- LSP 代码提示
require("lsp-configs.lsp-cmp").onstart();
