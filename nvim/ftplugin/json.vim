" json 文件不要高亮
augroup dont_lsp_document_highlight
 autocmd! * <buffer>
 " 解决 lsp 报错
 autocmd BufEnter <buffer> set eventignore=CursorHold,CursorHoldI,CursorMoved
 " 解决 comment 高亮问题
 autocmd BufEnter <buffer> set filetype=jsonc
augroup END
