" json 文件不要高亮
augroup dont_lsp_document_highlight
 autocmd! * <buffer>
 autocmd BufEnter <buffer> set eventignore=CursorHold,CursorHoldI,CursorMoved
augroup END
