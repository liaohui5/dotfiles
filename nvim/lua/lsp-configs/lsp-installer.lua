---------------------------------------------------------------------
-- 安装管理 LSP 服务器插件
-- docs:
-- https://github.com/williamboman/nvim-lsp-installer 
---------------------------------------------------------------------
local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
  vim.notify("[lsp] lsp_installer not found!")
  return
end

return {
  onstart = function ()
    -- 启动 lspinstaller
    https://github.com/williamboman/nvim-lsp-installer#default-configuration
    lsp_installer.setup({
      automatic_installation = true,
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
  end
}


