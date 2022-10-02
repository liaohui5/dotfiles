-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  启动高亮                                                                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯

return {
  setup = function(client, bufnr)
    -- 注: 不要使用 pattern="*"(代表所有buffer),
    -- 要使用 buffer="bufnr" 代表当前 buffer
    -- 因为使用 pattern="*" 可能导致报错,有的文件没有lsp支持
    if client.server_capabilities.document_highlight then
      -- vim.cmd([[
      --   augroup lsp_document_highlight
      --     autocmd! * <buffer>
      --     autocmd CursorHold  <buffer> silent lua vim.lsp.buf.document_highlight()
      --     autocmd CursorHoldI <buffer> silent lua vim.lsp.buf.document_highlight()
      --     autocmd CursorMoved <buffer> silent lua vim.lsp.buf.clear_references()
      --   augroup END
      -- ]])

      local group   = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
      local autocmd = vim.api.nvim_create_autocmd
      local buf     = vim.lsp.buf;

      -- normal 模式: 自动高亮光标位置的单词
      autocmd("CursorHold", {
        group    = group,
        buffer   = bufnr,
        callback = buf.document_highlight
      })

      -- insert 模式: 自动高亮光标位置的单词
      autocmd("CursorHoldI", {
        group    = group,
        buffer   = bufnr,
        callback = buf.document_highlight
      })

      -- 光标移开后自动取消高亮
      autocmd("CursorMoved", {
        group    = group,
        buffer   = bufnr,
        callback = buf.clear_references
      })
    end
  end
}
